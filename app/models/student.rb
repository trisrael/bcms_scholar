class Student < ActiveRecord::Base
  acts_as_content_block :taggable => true
end
