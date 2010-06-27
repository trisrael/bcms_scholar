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

end
