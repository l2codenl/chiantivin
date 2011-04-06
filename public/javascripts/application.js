// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  cart_check_for_quantity_update();
  page_toggle_menu();
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
