class Student < ActiveRecord::Base
  acts_as_content_block :taggable => true
  has_many :updates
  belongs_to :headshot, :class_name => "ImageBlock", :foreign_key => "headshot_id"
  belongs_to :thumbnail, :class_name => "ImageBlock", :foreign_key => "thumbnail_id"

  before_create :set_name
  before_update :set_name

  validates_presence_of :thumbnail_id, :headshot_id, :description, :first_name, :last_name
  can_tag
  
  def set_name
   self.name = first_name + " " + last_name
   true
  end

end
