// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

//for testing
$( document ).ready(function() {
    console.log( "ready!" );

//toggle 'edit' button on /profile
    $(".name-button").click(function(){
        $('.name-form').toggle();
    });
    $(".address-button").click(function(){
        $('.address-form').toggle();
    });
    $(".phone-button").click(function(){
        $('.phone-form').toggle();
    });

});