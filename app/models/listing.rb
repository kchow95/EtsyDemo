class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, default_url: "no_image.jpg"
		validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	else
  		has_attached_file :image, default_url: "no_image.jpg",
  		:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    	:path => ":style/:id_:filename"
    	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    end
 
 #this is where you validate input for listing
 validates :name, :description, :price, presence: true
 validates :price, numericality: {greater_than: 0}
 validates_attachment_presence :image
end

