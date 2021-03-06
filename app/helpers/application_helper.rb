# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

 def include_stylesheets

  #Allows for the case of no StyleSheets to call for style.css, causing an error
    if @stylesheet_content_arr
       out = '<style>'	 
       @style_sheet_arr.each do |ss|
         out << '/*' + ss.name.titleize + '*/'
         out << sanitize_css(ss.css_html)
       end
       out << '</style>'
       return out
    else
       stylesheet_link_tag('style')
    end

 end

 def include_javascripts
  arr = ['jquery', 'jquery-ui', 'jquery.dimensions', 'application']
  arr.collect{|js_name| javascript_include_tag(js_name)}.join('')
 end

 def render_main_nav
  setup_menu_items
  if @menu_items
    out = "<div id='menu'><ul>"
    @menu_items.each do |mi|
     out << "<li #{"class='current'" if mi[:selected]}>"
     out << "<a href='#{mi[:url]}'>"
     out << render_nav_link(mi[:name])
     out << "</a></li>"
    end
    out << "</ul></div>"
  end
  out
 end

private
 
 def render_nav_link(name)
  reset_cycle('link')
  name.strip!
  parts = name.split(/\s+/)
  out = "<span class='link_hover'>&nbsp;</span>"
  parts.each do |part|
   out << "<span class='#{cycle('odd', 'even', :name => 'link')}'>"
   out << part.upcase
   out << "</span>"
  end
  out
 end

 def setup_menu_items
   @menu_items = menu_items(:depth => 1)
   @menu_items.each do |menu_item| 
     last_slash = request.env['REQUEST_URI'].rindex('/')
     relative_url = last_slash ? request.env['REQUEST_URI'][0...last_slash] : menu_item[:url]
     if menu_item[:id].include?('section')
       menu_item[:id].gsub!('section', 'page')
     end     
     if similar_url?(menu_item[:url], relative_url) && relative_url.length > 1
       menu_item[:selected] = 'true'
     elsif menu_item[:url] == relative_url
       menu_item[:selected] = 'true'
     end
   end
   return menu_items
 end

 def similar_url?(act_url, rel_url)
   act_url.include?(rel_url) || act_url == rel_url
 end

end
