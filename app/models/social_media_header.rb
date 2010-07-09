class SocialMediaHeader < ActiveRecord::Base
  acts_as_content_block
  serialize :links
  
  def validate
   errors.add('There is already a SocialMediaHeader, update it.') if SocialMediaHeader.count == 1
  end

  def attributes=(attributes= nil)
  end


end
