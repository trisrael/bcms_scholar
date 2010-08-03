jQuery(document).ready(function(){


 //When sidebar is initialized
if($("#sidebar").children().length == 0){
 $("#inner_content").css('padding-left', '0px');
}else{
 //Move Tab menu from the left side

}

if($('#tab_menu')){
  Initializer.setupTabs();
} 
 Initializer.setupMenu(); 
});

if($('.company_container .pager')){

$('.company_container .pager li .thumbnail').hover(

function(){

 var el = $(this);
if( !el.hasClass('activeSlide') ){
  el.css('background-position', '-44px 0')
}
},

function(){
 var el = $(this);
if( !el.hasClass('activeSlide') ){
  el.css('background-position', '0 0')
}
}

);


}

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
 jQuery(".tab_content:not(.current)").hide();
 jQuery(".tab_content.current").show();


//Align TabMenu with first link
 var firstMenuLink = $('#menu li a')[0];
 var sidebar = $('#sidebar');
 var sidebarLeft = sidebar[0].offsetWidth - (firstMenuLink.offsetLeft + firstMenuLink.offsetWidth);
 sidebar.css("left",  "-" + sidebarLeft + "px");
 


jQuery("#tab_menu li").hover(
  
 function(){
  jQuery(this).addClass('focused');
 },
 function(){
  jQuery(this).removeClass('focused');
 }

 );
 
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

 //IE6 fix.
 if (jQuery.browser.msie && jQuery.browser.version.substr(0,3) == "6.0") {
 jQuery('.tab_content#' + stringref).show();
 }
 else
 //display our tab fading it in
 jQuery('.tab_content#' + stringref).fadeIn();

//Set content_wrapper height for footer
var studentHeight =  $('.student:visible').height();
var calcHeight = $('#main').height() + $('#testimonial').height() + 260;
var contentHeight = window.screen.height > calcHeight ? window.screen.height : calcHeight;
if(studentHeight + calcHeight > contentHeight){contentHeight = studentHeight + calcHeight}
$('#content_wrapper').css('height', (contentHeight + 40) + 'px');

 return false;
 });

//Set content_wrapper height for footer
var studentHeight =  $('.student:visible').height();
var calcHeight = $('#main').height() + $('#testimonial').height() + 260;
var contentHeight = window.screen.height > calcHeight ? window.screen.height : calcHeight;
if(studentHeight + calcHeight > contentHeight){contentHeight = studentHeight + calcHeight}
$('#content_wrapper').css('height', (contentHeight + 40) + 'px');


}


}
