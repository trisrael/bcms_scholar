class Cms::PageLinksController < Cms::ContentBlockController
 before_filter :setup_images, :only => [:edit, :new]


 helper :all

 def setup_images
  @images = ImageBlock.with_tag("page_link").collect{|image| [image.attachment.file_path, image.id]}
 end

end
