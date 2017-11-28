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

  $("#topscroll").click(function(e) {
    $('html, body').animate({ scrollTop: 0 }, 'slow');
  })
});

