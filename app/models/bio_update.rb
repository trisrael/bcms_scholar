class BioUpdate < ActiveRecord::Base
  acts_as_content_block
  belongs_to :bio
end
