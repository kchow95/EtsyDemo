class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, default_url: "no_image.jpg",
	else
  		has_attached_file :image, 
  		default_url: "no_image.jpg",
  		:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml")
    	:path => ":style/:id_:filename"
    end
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

