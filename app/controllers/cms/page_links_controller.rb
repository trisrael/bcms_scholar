class Cms::PageLinksController < Cms::ContentBlockController
 before_filter :setup_positions_for_new, :only => [:edit, :new]
 helper :all

 #method to setup available positions for a new PageLink to take 
 def setup_positions_for_new
   @positions = PageLink.all.collect{|page_link| page_link.position}
   
   @positions.sort!{|a, b| a.position <=> b.position}
   @positions << (@positions.last || 0) + 1 #Add an extra number for placing the number
 end
end
