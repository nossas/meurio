// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.turbolinks
//= require jquery.facebox
//= require jquery.mask.min
//= require turbolinks
//= require foundation
//= require rails.validations
//= require rails.validations.turbolinks
//= require users

$.facebox.settings.closeImage = 'http://i.imgur.com/k9awT9O.png'
$.facebox.settings.loadingImage = 'http://i.imgur.com/bFbQqWu.gif'

function showNetDiv(div){
  $('#funders_button').removeClass("selected");
  $('#team_button').removeClass("selected");
  $('#users_button').removeClass("selected");
  $('#' + div + '_button').addClass("selected")
  $('#net_content').load(div);
}

function maskElements() {
  $('.phone_with_ddd').mask('(00) 000000000');
  $('.postcode').mask('00000-000');
  $('.date').mask('00/00/0000');
  $('.date').datepicker({
    dateFormat: 'dd/mm/yy',
    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
    nextText: 'Próximo',
    prevText: 'Anterior'
  });
}

function flash() {
  setTimeout( function(){ $(".flash").slideDown('slow') }, 100)
  setTimeout( function(){ $(".flash").slideUp('slow') }, 16000)
  $(document).on('click', '.flash', function(){ $('.flash').slideUp() })
}

$(document).bind('reveal.facebox', function() {
  $('form.new_user').enableClientSideValidations();
});

// Initialization
$(function(){
  flash();
  maskElements();
  $('a[rel*=facebox]').facebox();

  showNetDiv("funders");
  $('#funders_button').click(function(){ showNetDiv('funders'); });
  $('#team_button').click(function(){ showNetDiv('team'); });
  $('#users_button').click(function(){ showNetDiv('users'); });
  
  $(".twitter-share-button").click(function(event){
    window.open(
      $(event.target).attr("href"), 
      'twitter-share-dialog', 
      'width=550,height=450'
    ); 
    return false;
  });

  $(".facebook-share-button").click(function(event){
    window.open(
      $(event.target).attr("href"), 
      'facebox-share-dialog', 
      'width=626,height=436'
    ); 
    return false;
  });
})
