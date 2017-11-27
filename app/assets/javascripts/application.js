// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require rails-ujs
//= require_tree .


$( document ).ready(function() {


 $("#amount").on('keyup',function(e){
  if(e.keyCode === 13) {
    e.preventDefault();
    $('#error_explanation').html('');
    var amount = $('input#amount').val();
    amount = amount.replace(/\$/g, '').replace(/\,/g, '')

    amount = parseFloat(amount);

    if (isNaN(amount) || amount == 0)  {
      $('#error_explanation').html('<p>Please enter a valid amount in CAD ($).</p>');
    }
    else {
      amount = amount * 100; // Needs to be an integer!
      handler.open({
        amount: Math.round(amount)
      })
    }
  };
 });

  $(document).on('click', 'a.first[href^="#"], a.second[href^="#"]', function (event) {
    event.preventDefault();

    $('html, body').animate({
        scrollTop: $($.attr(this, 'href')).offset().top
    }, 500);
  });










  // SEARCH BAR
  $( "#search" ).click(function(e) {
    e.preventDefault();
    $("#search_box").toggleClass('active');
    $("#search_box").find("#term").focus();
  });

$(window).scroll(function() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      document.getElementById("topscroll").style.display = "block";
  } else {
      document.getElementById("topscroll").style.display = "none";
  }
});

// scroll to top
$("#topscroll").click(function(e) {
  $('html, body').animate({ scrollTop: 0 }, 'slow');
})

});

