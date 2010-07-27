class CarouselPage < ActiveRecord::Base
  acts_as_content_block
  belongs_to :image_block
  validates_presence_of :title
  validates_presence_of :name
  validates_presence_of :descriptive_content
  validate :image_or_eyecatcher
   
private

 def image_or_eyecatcher
   unless (!attributes['image_block_id'].blank? ^ !attributes['eyecatcher_content'].blank?)
     errors.add "Image or Eyecatcher content and not both."
   end
 end

end
