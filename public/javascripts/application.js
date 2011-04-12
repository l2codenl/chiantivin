$(document).ready(function(){
  cart_check_for_quantity_update();
  page_toggle_menu();
  go_home();
  //validate_order();
});

function cart_check_for_quantity_update(){
  $('.quantity select').change(function(){
    $(this).parent('form').submit();
  });
}

function page_toggle_menu(){
  $('.addmenu').change(function(){
    $(this).parent('form').submit();
  });
}

function go_home(){
  $('#header').click(function(){
    window.location = '/';
  });
}

function validate_order(){
  $("#new_order").validate({
    debug: true,
    rules: {
      "order[email]": {required: true, email: true },
      "order[postalcode]": {required: true},
      "order[accountnumber]": {required: true},
      "order[accountowner]": {required: true},
      "order[address]": {required: true},
      "order[surname]": {required: true},
      "order[firstname]": {required: true}
    }
  });
} 
