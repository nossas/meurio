class Organization < ActiveRecord::Base
  def avatar_url
    if self.avatar
      "https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/organization/avatar/#{self.id}/square_#{self.avatar}"
    else
      "http://i.imgur.com/lsAFCHL.jpg"
    end
  end

  def fetch_images_and_clippings_from_facebook
  	begin
  		Rails.logger.info "Fetching #{self.name}'s images and clippings from Facebook..."

  		images = Koala::Facebook::API.new.get_connections(self.facebook_page_uid, "photos", type: "uploaded", fields: "name,source,created_time,link").select{|image| image["name"].present?}
	    
	    images.each do |image|
	      mobilization = Mobilization.where("hashtag IN (?)", image["name"].scan(/#[\S]+/).map{|h| h.delete("#")}).first

	      if mobilization.present?
	        if image["name"].match(/#NaMídia/)
	          Clipping.create(
	            remote_image_url: image["source"],
	            hashtag:          mobilization.hashtag,
	            uid:              image["id"],
	            published_at:     Time.parse(image["created_time"]),
	            link:             image["link"],
	            body:             image["name"],
	            organization_id:  self.id
	          )
	        else
	          Image.create(
	          	remote_file_url: image["source"], 
	          	hashtag: 				 mobilization.hashtag, 
	          	uid: 						 image["id"], 
	          	organization_id: self.id
	          ) 
	        end
	      end
	    end

	    Rails.logger.info "...Done!"
	  rescue Exception => e
	  	Appsignal.add_exception e
      Rails.logger.info "Could not fetch #{self.name}'s images and clippings from Facebook"
      Rails.logger.info e.message
	  end  
  end

  def fetch_posts_from_facebook limit = 25
  	Rails.logger.info "Fetching #{self.name}'s posts from Facebook..."
  	
    begin
	  	posts = Koala::Facebook::API.new(ENV["FB_APP_TOKEN"]).get_connections(self.facebook_page_uid, "posts", fields: "from,message,created_time,id", limit: limit)
	  	Rails.logger.info "Posts found: #{posts.count}"
	        
	    posts.each do |post|
	      Mobilization.all.each do |mobilization|
	        next if post["message"].nil?
    
          if post["message"].index(mobilization.hashtag).present?
            FacebookPost.create(
              hashtag:      	 mobilization.hashtag,
              username:     	 post["from"]["name"],
              text:         	 post["message"],
              published_at: 	 post["created_time"],
              user_uid:     	 post["from"]["id"],
              uid:          	 post["id"],
              organization_id: self.id
            )
          end
	      end
	    end

	    Rails.logger.info "...Done!"
    rescue Exception => e
      Appsignal.add_exception e
      Rails.logger.info "Could not fetch and create #{self.name}'s posts"
      Rails.logger.info e.message
    end
  end
end
