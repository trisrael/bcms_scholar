class LinksListPortlet < Portlet
 before_destroy{|portlet| 
  portlet.name == "Social Media Headers" ? false : true 
}

 before_create{|portlet|
 #Ensure this is a ''singleton'' named Portlet 
 test = true;
 if portlet.name == "Social Media Headers" 
  if self.find_by_name("Social Media Headers" )
   test = false 
  end
 end
 test
 }

  enable_template_editor true
     
  def render
    @page_links = PageLink.all
  end
    
end
