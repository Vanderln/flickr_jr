$(document).ready(function() {
  var check_email = /\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3}/;
  var check_capital = /[A-Z]+/;
  var check_length = /.{8,}/;
  var check_numeric = /[0-9]+/;
  //form validations
  $('#signup').on('click',function(e) {
    $("#errors_create").empty();
    e.preventDefault(); 
    var email_input = $('#signup').parent().find('input[name=email]').val();
    var pass_input = $('#signup').parent().find ('input[name=password]').val(); 
    var name_input = $('#signup').parent().find ('input[name=username]').val();       
    if (!check_length.test(name_input)) {
      $("#errors_create").append('<li>Your username must have 8 characters</li>');
    }
    if (!check_email.test(email_input)) {
      $("#errors_create").append('<li>Please enter a valid email</li>');
    }
    if (!check_capital.test(pass_input)) {
      $("#errors_create").append('<li>Password must contain a capital letter</li>');
    }
    if (!check_length.test(pass_input)) {
      $("#errors_create").append('<li>Please enter a password of at least 8 characters</li>');                
    }
    if (!check_numeric.test(pass_input)) {
      $("#errors_create").append('<li>Password must contain 1 number</li>');
    }
  
    if (pass_input.length === 0) {
      $("#errors_create").append('<li>Please enter a password</li>');
    }
    if ($('#errors_create li').length === 0) {
      $('#signup').parent().submit();
    }       
  });

  $('#signin').on('click',function(e){
    $("#errors_login").empty();
    e.preventDefault();
    var email_input = $('#signin').parent().find('input[name=email]').val();
    var pass_input = $('#signin').parent().find ('input[name=password]').val(); 
    var name_input = $('#signin').parent().find ('input[name=username]').val();
    if (name_input.length === 0) {
      $("#errors_login").append('<li>Please enter a username</li>');
    }
    if (pass_input.length === 0) {
      $("#errors_login").append('<li>Please enter a password</li>');
    }

    if ($('#errors_login li').length === 0) {
      $('#signin').parent().submit();
    }  
  });
//form validations end
//carousel animations
  $('#next_frame').click(function(){
    
    if ($('.frames').css("right") == "200%") {
      $('.frames').animate({right:'0%'}, 100);
    } else {
      $('.frames').animate({right:'+=100%'}, 1000)};
  });

  $('#previous_frame').click(function(){
    
    if ($('.frames').css("right") == "0%"){
      $('.frames').animate({right:'200%'}, 1000);
    }
    else {
      $('.frames').animate({right:'-=100%'}, 150)};
  });
});
