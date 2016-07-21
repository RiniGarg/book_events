jQuery(document).on('ready',function(){
  jQuery(".yes_no_event").on('click',function(){
    
    jQuery.ajax({
      url: jQuery(this).data("url"),
      data: {
          is_going: jQuery(this).hasClass("yes_event")
      },
      type: "POST"
    });
    
  });
});
   