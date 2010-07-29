class CompanyPortlet < Portlet
  validates_presence_of :student_filter
  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
     
  def render
    @students = Student.with_tag(self.student_filter)
  end
    
end
