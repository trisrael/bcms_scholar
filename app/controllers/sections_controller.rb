class SectionsController < Cms::ContentController
  include Cms::Acts::ContentPage
  helper :all
  before_filter :setup_section_attributes
  before_filter :cms_properties_setup
  

#Renders 'Section' roots, with sub-menu of children and default tab-selected unless another tab-brought in.
  def index
    render 'base.html.erb', :layout => 'templates/default'
  end

  private 

  def cms_properties_setup
    if current_user.able_to?(:edit_content) #Someone is logged into the CMS  
      @show_toolbar = true
      @mode = 'edit'
      @show_page_toolbar = true
    end
  end

  def setup_section_attributes

    path = request.env['REQUEST_PATH']
    
    @section = Section.find_by_path(path)

    unless @section
      #Find the Section through one of its child pages
      @current_page = Page.find_by_path(path)
      @section = @current_page.top_level_section
    end

    setup_connectors
  end
 
  #Setup up a hash to make the page, along with its connectables, available for each 'Tab'
  def setup_connectors
    
   @tab_data = []
   if @section
     @section.visible_child_nodes.each do |child|
       if child.node_type == 'Page'
         @page = child.node
         #Default to first page as page to Edit
         @current_page = @page unless @current_page
         prepare_connectables_for_render
         @tab_data <<
         {:page => @page, :connectors => @_connectors, :connectables => @_connectables }
       end
     end
   end
  
  end

end
