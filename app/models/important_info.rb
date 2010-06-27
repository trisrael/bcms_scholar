class ImportantInfo < ActiveRecord::Base
  acts_as_content_block
  belongs_to :page

end
