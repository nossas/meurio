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

  def fetch_likes_shares_and_comments_from_facebook
  	graph = Koala::Facebook::API.new(ENV["FB_APP_TOKEN"])
  	Rails.logger.info "Fetching #{self.name}'s likes, shares and comments from Facebook..."

    posts = FacebookPost.where("created_at >= ? AND username = ?", Time.current - 1.day, self.name)
    Rails.logger.info "Posts found: #{posts.count}"

    posts.each do |fp|
      begin
        post = graph.get_object(fp.uid, fields: "shares,likes.limit(1).summary(1),comments.limit(1).summary(1)")
    
        if post["shares"].present?    then fp.share_count = post["shares"]["count"] end
        if post["likes"].present?     then fp.like_count = post["likes"]["summary"]["total_count"] end
        if post["comments"].present?  then fp.comment_count = post["comments"]["summary"]["total_count"] end
    
        fp.save!
      rescue Exception => e
        Appsignal.add_exception e
        Rails.logger.info "Could not update FacebookPost ##{fp.id}"
        Rails.logger.warn e.message
      end
    end
    Rails.logger.info "...Done!"
  end

  def fetch_events_from_facebook
  	Rails.logger.info "Fetching #{self.name}'s events from Facebook..."

  	begin
	  	events = Koala::Facebook::API.new(ENV["FB_APP_TOKEN"]).get_connections(self.facebook_page_uid, "events", fields: "id,description,name").select{|event| event["description"].present?}
	  	Rails.logger.info "Events found: #{events.count}"
	    
	    events.each do |event|
	      mobilization = Mobilization.where("hashtag IN (?)", event["description"].scan(/#[\S]+/).map{|h| h.delete("#")}).first
	      
	      if mobilization.present?
	        Event.create(
	          hashtag:         mobilization.hashtag,
	          name:            event["name"],
	          description:     event["description"],
	          link:            "http://facebook.com/events/#{event['id']}",
	          uid:             event["id"],
	          organization_id: self.id
	        )
	      end
	    end

	    Rails.logger.info "...Done!"
    rescue Exception => e
      Appsignal.add_exception e
      Rails.logger.info "Could not fetch and create #{self.name}'s events"
      Rails.logger.warn e.message
    end    
  end
end
