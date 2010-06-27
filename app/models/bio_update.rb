class BioUpdate < ActiveRecord::Base
  acts_as_content_block :publishable => false
  belongs_to :bio

end
