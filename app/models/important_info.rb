class ImportantInfo < ActiveRecord::Base
  acts_as_content_block
  belongs_to :page

  def validate_on_create
   errors.add("'#{page.name.titleize}'", "already has an Important Info.") if ImportantInfo.find(:first, :conditions => {:page_id => page_id} )
  end

  def attributes=(attributes = nil)
   attributes[:page] = Page.find(attributes[:page].to_i)
   super 
  end

end
