// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-transition
//= require bootstrap-affix
//= require bootstrap-alert
//= require bootstrap-button
//= require bootstrap-carousel
//= require bootstrap-collapse
//= require bootstrap-dropdown
//= require bootstrap-modal
//= require bootstrap-scrollspy
//= require bootstrap-tab
//= require bootstrap-tooltip
//= require bootstrap-popover
//= require bootstrap-typeahead
//= require bootstrap-datetimepicker
//= require_tree .

$(document).on('ready page:change', function() {

	var startDate = new Date(),
      endDate = new Date();
      
  endDate.setDate(endDate.getDate()+365);
      
  $('.datetimeinput-wrapper').datetimepicker({
    language: 'en',
    pick12HourFormat: true,
    startDate: startDate,
    endDate: endDate
  });
  
  $('.timeinput-wrapper').datetimepicker({
    language: 'en',
    pick12HourFormat: true,
    pickDate: false,
  });
  
  /*
  $('#call-case-manager-desktop').on('click', function() {
    $(this).toggleClass('number');
  });
  */
  
  // init tooltips
  $(".show-tooltip").tooltip();
});