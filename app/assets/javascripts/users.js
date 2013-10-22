$(function(){
  $('.form .image .btn').click(function(){ $('input#user_image').trigger('click'); });
  $('input#user_image').change(function(){ $('form#edit_user_image').submit(); });
});
