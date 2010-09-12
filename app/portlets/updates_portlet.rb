class UpdatesPortlet < Portlet
  validates_presence_of :tag_list, :name
  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
     
  def render
    @updates = Update.with_tag(self.tag_list).find(:all, :order => "created_at DESC")
  end
    
end
