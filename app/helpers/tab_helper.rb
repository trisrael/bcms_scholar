module TabHelper

 def render_tab_menu(tab_names)
  tab_menu = "<ul id='tab_menu'>"
  tab_names.each_with_index do |tab_name, i|
    tab_menu << "<li class='tab_header' id='tab_header_#{i}'><a href='#tab_content_#{i}'>#{tab_name}</a></li>"  
  end
  tab_menu << "</ul>"
 end
 
 def render_tabs

   if @tab_data
    tab_names = []
    tabs_content = ""
    tabs_content << "<div id='tabs_container'>"
    @tab_data.each_with_index do |tab, i|
    tab_names << tab[:page].name
    tabs_content << "<div id='tab_content_#{i}' class='tab_content' style='display: none;'>"
    tab[:connectors].each_with_index do |connector, i|
     tabs_content << render_connector_and_connectable(connector, tab[:connectables][i])
    end
    tabs_content << "</div>"
   end
    tabs_content << "</div>"
   return render_tab_menu(tab_names) + tabs_content
   end
 end

end
