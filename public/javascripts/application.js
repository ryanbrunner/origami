// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(".add_post a").live("ajax:success", function(event, data) {
  $(this).after(data);

});