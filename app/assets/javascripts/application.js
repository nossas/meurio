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
//= require turbolinks
//= require foundation
//= require jquery.facebox
//= require rails.validations
//= require rails.validations.turbolinks

$.facebox.settings.closeImage = 'http://i.imgur.com/k9awT9O.png'
$.facebox.settings.loadingImage = 'http://i.imgur.com/bFbQqWu.gif'

function showNetDiv(div){
  $('#funders_button').removeClass("selected");
  $('#team_button').removeClass("selected");
  $('#' + div + '_button').addClass("selected")
  $('#net_content').load(div);
}

$(function(){
  $('a[rel*=facebox]').facebox();

  showNetDiv("funders")
  $('#funders_button').click(function(){ showNetDiv('funders') })
  $('#team_button').click(function(){ showNetDiv('team') });
  
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
