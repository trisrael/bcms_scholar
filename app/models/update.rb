class Update < ActiveRecord::Base
  acts_as_content_block :taggable => true, :versioned => false
  belongs_to :student
  validates_presence_of :student_id, :update_text, :name 
  can_tag
end
