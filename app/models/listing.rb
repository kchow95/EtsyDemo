class Listing < ActiveRecord::Base
  		has_attached_file :image, default_url: "no_image.jpg",
  		:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    	:path => ":style/:id_:filename"
    	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
 
end

