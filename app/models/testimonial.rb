class Testimonial < ActiveRecord::Base
  acts_as_content_block
  validates_presence_of :name
  validates_presence_of :text
end
