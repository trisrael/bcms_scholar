module PageLinkHelper

def link_inner_content
 out = ""
 if @content_block.attachment
   if @content_block.published? 
     out << image_tag(@content_block.attachment.file_path)
   else
     out << image_tag(url_for(@content_block.attachment))
   end
   return out
 end

   out << @content_block.link_name
end

end
