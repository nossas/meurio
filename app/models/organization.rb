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
  		Rails.logger.info "Fetching #{organization.name}'s images and clippings from Facebook..."

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
      Rails.logger.info "Could not fetch #{organization.name}'s images and clippings from Facebook"
      Rails.logger.info e.message
	  end  
  end
end
