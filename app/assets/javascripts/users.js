// copied/pasted from project -- did not write this

    // make sure the document is ready before running this code
$(document).ready(function() {
    // retrieve stripe public key
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  // Watch for a form submission:
    // form-submit-btn is the id attributed to the submit button in the pro form. so when that button is clicked..
  $("#form-submit-btn").click(function(event) {
      // prevent default submission to the server
    event.preventDefault();
        // disables the button while processing
    $('input[type=submit]').prop('disabled', true);
        // error variable if error messaged needed later
    var error = false;
        // creating local variables for each relevant form field
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();
    
        // if there are not any errors
    if (!error) {
      // ship off to stripe. passing in variables established above
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler); // defined below
    }
    return false;
  }); // form submission
  
    // function with two arguments. these get generated in stripe's response to above
  function stripeResponseHandler(status, response) {
        // Get a reference to the form:
        // create a variable that represents the entire form
    var f = $("#new_user");

        // Get the token from the response:
        // create a variable to store the token which gets generated in stripe's response
    var token = response.id;

        // Add the token to the form variable created above (that represents the entire form
    f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');

        // Submit the form:
        // this is initiating what we disabled in the begining of file
    f.get(0).submit(); 
  }
});