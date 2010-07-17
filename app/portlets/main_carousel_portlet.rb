class MainCarouselPortlet < Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor true
     
  def render
    @carousel_blocks = CarouselPage.all(:order => "position desc")
  end
    
end
