module TabHelper

 def render_tab_menu(tab_names, section_name)
  out = "<div id='tab_menu' class='#{'cms_editing' if @mode == 'edit'}'><ul>"
  tab_names.each_with_index do |tab_name, i|
    out << "<li class='tab_header #{'current' if (@current_page && @current_page.name == tab_name)} #{section_name}' id='tab_header_#{i}'><a href='#tab_content_#{i}'>#{render_tab_name(tab_name)}</a></li>"  
  end
  out << "</ul></div>"
  out
 end

 def render_tab_name(tab_name)
   out = ""
   #TODO: replace the following with the regexp for whitepace
   tab_name.split(/\s/).each_with_index do |name_partial, index|
   out << "<span class='partial_#{index}'>#{name_partial}</span>"
  end
   out
 end
 
 def render_tabs

   if @tab_data
    @tab_names = []
    tabs_content = ""
    tabs_content << "<div id='tabs_container'>"
    @section_name = @tab_data.first[:page].top_level_section.name.underscore
    @section_name.gsub!(" ", "_")
    @tab_data.each_with_index do |tab, i|
    @tab_names << tab[:page].name

    tabs_content << "<div id='tab_content_#{i}' class='tab_content #{'current' if (@current_page && tab[:page].name == @current_page.name)}' style='display: none;'>"
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
   return tabs_content
   end
 end

end
