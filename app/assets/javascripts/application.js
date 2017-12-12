//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require rails-ujs
//= require_tree .

$( document ).ready(function() {



  $('.next-section').click((e)=>{
      let selected = $('.active-section');
      let sections = $('section');
      let pos = sections.index(selected);
      let next = sections.get(pos +1);
      let prev = sections.get(pos -1);

      let nextSection = $(next);
      $(selected).removeClass('active-section');
      $(nextSection).addClass('active-section');

      if( nextSection.offset()){
        $('html, body').animate({ scrollTop: nextSection.offset().top + 'px'},600);
      } else {
        next = sections.get(0);
        nextSection = $(next);
        $(nextSection).addClass('active-section');
        $('html, body').animate({ scrollTop: 0 + 'px'},600);
      }

      e.preventDefault();

  });


  $('.prev-section').click((e)=>{
      let selected = $('.active-section');
      let sections = $('section');
      let pos = sections.index(selected);
      let next = sections.get(pos +1);
      let prev = sections.get(pos -1);
      let prevSection = $(prev);
      $(selected).removeClass('active-section');
      $(prevSection).addClass('active-section');

      if( prevSection.offset() && pos !== 1 && sections.length !== 1){
        $('html, body').animate({ scrollTop: prevSection.offset().top + 'px'},600);
      } else {
        $('html, body').animate({ scrollTop: 0 + 'px'},600);
      }

      e.preventDefault();

  });


  $("#amount").on('keyup',function(e){
    if(e.keyCode === 13) {
      e.preventDefault();
      $('#error_explanation').html('');
      var amount = $('input#amount').val();
      amount = amount.replace(/\$/g, '').replace(/\,/g, '')

      amount = parseFloat(amount);

      if (isNaN(amount) || amount <= 0)  {
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
       $("#prevscroll").show(600);
        $("#nextscroll").show(600);
        $("#topscroll").show(600);
        document.getElementById("topscroll").style.display = "inline";
    } else {
      $("#prevscroll").hide(600);
      $("#nextscroll").hide(600);
      $("#topscroll").hide(600);
         // document.getElementById("topscroll").style.display = "none";
    }
  // keep track of active-section
  //  if active section scrollTop is less then this is the new
      let currentHeight = $(this).scrollTop();
      let sections = $('section');
      let newActive = sections.map(function(){
        if ($(this).offset().top <= currentHeight)
       return this;
      });

      $('.active-section').removeClass('active-section');
      $(newActive.last()).addClass('active-section');


  });

  $("#topscroll").click(function(e) {
      let selected = $('.active-section');
      let sections = $('section');
      let first = sections.get(0);

      let firstSection = $(first);
      $(selected).removeClass('active-section');
      $(firstSection).addClass('active-section');

        $('html, body').animate({ scrollTop: 0 + 'px'},600);


  });


});



