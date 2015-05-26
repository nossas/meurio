// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  if (!localStorage.visited) {
    $('#application-extended').foundation('reveal', 'open');
    localStorage.setItem('visited', 'true');
  }
});
