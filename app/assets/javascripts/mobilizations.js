// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  $('.fact-img').each(function() {
    $(this).css('margin-top', $(this).closest('.item').height()/2 - 30);
  });
});

// mobilizations#index
var usersPage = 0;
var fundersPage = 0;
var mobilizationsPage = 0;

function showNetDiv(div){
  $('#funders_button').removeClass("selected");
  $('#team_button').removeClass("selected");
  $('#users_button').removeClass("selected");
  $('#' + div + '_button').addClass("selected")

  $('.funders').hide();
  $('.users').hide();
  $('.team').hide();
  $('.' + div).show();
}

function loadUsers(){
  usersPage++;
  $("a#load_more_users_button").hide();
  $(".users .loader").show();
  $.get("/users?page=" + usersPage, function(data) {
    $("#users").append(data);
    if($("#users").data("count") <= $("#users .member").length)
      $("a#load_more_users_button").remove();
    $("a#load_more_users_button").show();
    $(".users .loader").hide();
  });
}

function loadFunders(){
  fundersPage++;
  $("a#load_more_funders_button").hide();
  $(".funders .loader").show();
  $.get("/funders?page=" + fundersPage, function(data) {
    $("#funders").append(data);
    if($("#funders").data("count") <= $("#funders .member").length)
      $("a#load_more_funders_button").remove();
    $("a#load_more_funders_button").show();
    $(".funders .loader").hide();
  });
}

function loadTeam(){
  $.get("/team", function(data) { $("#team").append(data); });
}

function loadMobilizations(){
  mobilizationsPage++;
  $("a#load_more_mobilizations_button").hide();
  $(".mobilizations .loader").show();
  $.get("/mobilizations?territorial=false&page=" + mobilizationsPage, function(data) {
    $("#mobilizations-list").append(data);
    if($("#mobilizations-list").data("count") <= $("#mobilizations-list .mobilization").length)
      $("a#load_more_mobilizations_button").remove();
    $("a#load_more_mobilizations_button").show();
    $(".mobilizations .loader").hide();
  });
}

function loadTerritorialMobilizations(){
  $.get("/mobilizations?territorial=true", function(data) {
    $("#territorial-mobilizations-list").append(data);
  });
}

$(function(){
  loadMobilizations();
  loadTerritorialMobilizations();
  loadUsers();
  loadFunders();
  loadTeam();
  showNetDiv("users");

  $("a#load_more_users_button").click(function(){
    loadUsers();
    return false;
  });

  $("a#load_more_funders_button").click(function(){
    loadFunders();
    return false;
  });

  $('#funders_button').click(function(){
    showNetDiv('funders');
    return false;
  });

  $('#team_button').click(function(){
    showNetDiv('team');
    return false;
  });

  $('#users_button').click(function(){
    showNetDiv('users');
    return false;
  });

  $("a#load_more_mobilizations_button").click(function(){
    loadMobilizations();
    return false;
  });
});
