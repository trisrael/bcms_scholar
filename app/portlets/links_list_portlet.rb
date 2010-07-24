class LinksListPortlet < Portlet
 before_destroy{|portlet| portlet.name == "Social Media Headers" ? false : true }

  enable_template_editor true
     
  def render
    @page_links = PageLink.all
  end
    
end
