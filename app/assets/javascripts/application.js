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
//= require jquery.facebox
//= require jquery.mask.min
//= require foundation
//= require rails.validations
//= require modernizr
//= require users
//= require mobilizations
//= require meurio_ui
//= require pages

$.facebox.settings.closeImage = 'http://i.imgur.com/k9awT9O.png'
$.facebox.settings.loadingImage = 'http://i.imgur.com/bFbQqWu.gif'

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

function smoothScroll() {
  var target = this.hash, $target = $(target);

  $('html, body').stop().animate({
    'scrollTop': $target.offset().top
  }, 1000, 'swing', function () {
    window.location.hash = target;
  });
}

$(document).bind('reveal.facebox', function() {
  $('form.new_user').enableClientSideValidations();
});

// Initialization
$(function(){
  $(document).foundation();
  flash();
  maskElements();
  $('a[rel*=facebox]').facebox();

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

  $(document).on('click', ".application_menu a", function(e){
    var target = this.hash, $target = $(target);

    $('html, body').stop().animate({
      'scrollTop': $target.prev().offset().top
    }, 1000, 'swing', function () {
      window.location.hash = target;
    });
  });

  // Pages#founders
  $(document).on('click', "a[href='#founders-subscription']", smoothScroll);
  $(document).on('click', ".founders-top-bar a", smoothScroll);
  $("li[data-orbit-slide='0']").trigger("click");

  $("#founders-orbit").on("after-slide-change.fndtn.orbit", function(event, orbit) {
    $(".founders-slider").removeClass("founders-slider-0");
    $(".founders-slider").removeClass("founders-slider-1");
    $(".founders-slider").removeClass("founders-slider-2");
    $(".founders-slider").addClass("founders-slider-" + orbit.slide_number);
  });
})
