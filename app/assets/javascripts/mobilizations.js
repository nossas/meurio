// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $('.fact-img').each(function() {
    $(this).css('margin-top', $(this).closest('.item').height()/2 - 30);
  });
});