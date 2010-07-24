class PageLink < ActiveRecord::Base
  acts_as_content_block
  belongs_to :image_block
  validates_presence_of :name
  validate :image_or_name
  validates_presence_of :link_url
  validates_format_of :link_url, :with => /^(http|https|ftp):\/\/.*/     

    private
	def image_or_name
	 unless(attributes['image_block_id'] || !attributes['link_name'].blank?) 
	  errors.add("Must supply either a Title or an Image") 
 	 end
	end
end
