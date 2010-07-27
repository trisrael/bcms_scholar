jQuery(document).ready(function(){

if($("#floating_sidebar:empty")){
  $("#main").css("width","80%");
  $("#main").css("margin","0 10%");
}


if($('#tab_menu')){
  Initializer.setupTabs();
} 
 Initializer.setupMenu(); 
});

var Initializer = {

setupMenu: function(){
 if(!$('#menu')){return;} // Return if the base element needed to initialize is not available
 jQuery("#menu li.current .link_hover").addClass('focused');
/**
 jQuery("#menu li:not(.current)").hover(
  
 function(){
  jQuery('.link_hover', this).addClass('focused');
 },
 function(){
  jQuery('.link_hover', this).removeClass('focused');
 }

 );
**/
}, 

setupTabs: function() {
 jQuery(".tab_content:not(.current)").hide();
 jQuery(".tab_content.current").show();
 
 jQuery(".tab_header a").click(function(){
//Switch "current" Tab selected
 jQuery(".tab_header.current").removeClass("current"); //currently selected tab

 jQuery(this.parentNode).addClass("current");

 //get the ID of the "tab_content" element to be unhidden
 stringref = jQuery(this).attr("href").split('#')[1];

 //hide the tabs not matching the ID
 jQuery('.tab_content:not(#'+stringref+')').hide();
 
 //Update the CMS Editor container with the correct page_id for Connectables linking. 
 links_to_update = jQuery('.cms_edit_container div a');
 if(links_to_update.length > 0){
 bcmsPageId  = jQuery('#' + stringref + " input").attr('value');


 links_to_update.each(function(){
   oldHref = this.href;
   newHref = oldHref.replace(/page_id=.*$/, 'page_id=' + bcmsPageId);
   this.href = newHref;
  });

  

 }
 
var visualEditorButton = jQuery('a.sm_button');
  if(visualEditorButton.length > 0){
   debugger;
  }


 //IE6 fix.
 if (jQuery.browser.msie && jQuery.browser.version.substr(0,3) == "6.0") {
 jQuery('.tab_content#' + stringref).show();
 }
 else
 //display our tab fading it in
 jQuery('.tab_content#' + stringref).fadeIn();
 return false;
 });
}

}
