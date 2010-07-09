jQuery(document).ready(function(){


 Initializer.setupTabs();
 Initializer.setupMenu();
 
 
});

var Initializer = {

setupMenu: function(){
 if(!$('#menu')){return;} // Return if the base element needed to initialize is not available
 jQuery("#menu li.current .link_hover").addClass('focused');

 jQuery("#menu li:not(.current)").hover(
  
 function(){
  jQuery('.link_hover', this).addClass('focused');
 },
 function(){
  jQuery('.link_hover', this).removeClass('focused');
 }
 );

}, 
setupTabs: function() {
 if(!$('#tab_menu')){return;} // Return if the base element needed to initialize is not available
 jQuery(".tab_content:not(:first)").hide();
 jQuery(".tab_content:first").show();
 
 jQuery(".tab_header a").click(function(){
 //get the ID of the element we need to show
 stringref = jQuery(this).attr("href").split('#')[1];
 //hide the tabs that doesn't match the ID
 jQuery('.tab_content:not(#'+stringref+')').hide();
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
