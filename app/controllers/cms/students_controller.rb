class Cms::StudentsController < Cms::ContentBlockController

before_filter :new_setup, :only => :new

private

def new_setup
  @headshots=  ImageBlock.with_tag('headshot') || []
  @thumbnails= ImageBlock.with_tag('thumbnail') || []
 #TODO: make this safe against changes in the CMS
 @company_tabs = Section.find_by_name("The Company").pages || []
end

end
