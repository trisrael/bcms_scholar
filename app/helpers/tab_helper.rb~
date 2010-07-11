module TabHelper

 def render_tab_menu(tab_names, section_name)
  tab_menu = "<ul id='tab_menu'>"
  tab_names.each_with_index do |tab_name, i|
    tab_menu << "<li class='tab_header #{'current' if i == 0} #{section_name}' id='tab_header_#{i}'><a href='#tab_content_#{i}'>#{tab_name.upcase}</a></li>"  
  end
  tab_menu << "</ul>"
 end
 
 def render_tabs

   if @tab_data
    tab_names = []
    tabs_content = ""
    tabs_content << "<div id='tabs_container'>"
    section_name = @tab_data.first[:page].top_level_section.name.underscore
    section_name.gsub!(" ", "_")
    @tab_data.each_with_index do |tab, i|
    tab_names << tab[:page].name
    tabs_content << "<div id='tab_content_#{i}' class='tab_content' style='display: none;'>"
    #Add in hidden input which holds the page id => Used by Tab switching javascript to update URL
    #of CMS toolbar, so that when adding Connectables they point to the correct page.
    tabs_content << "<input class='page_id' type='hidden' value='#{tab[:page].id}' />"
    tabs_content << "<input class='published' type='hidden' value='#{tab[:page].container_published?(:main)}' />"
    tab[:connectors].each_with_index do |connector, i|
     tabs_content << render_connector_and_connectable(connector, tab[:connectables][i])
    end
    tabs_content << "</div>"
   end
    tabs_content << "</div>"
   return render_tab_menu(tab_names, section_name) + tabs_content
   end
 end

end
