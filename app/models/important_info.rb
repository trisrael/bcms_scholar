class ImportantInfo < ActiveRecord::Base
  acts_as_content_block :taggable => true
  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :name
end	
