class CarouselPortlet < Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
     
  def render
     @carousel_pages  = CarouselPage.all
  end
    
end
