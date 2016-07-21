jQuery(document).on('ready',function(){
  jQuery(".make_remove_admin").on('click',function(){
  	
    jQuery.ajax({
      url: jQuery(this).data("url"),
      data: {
          is_admin: jQuery(this).hasClass("make_admin")
      },
      type: "POST"
    });

    if(jQuery(this).hasClass("remove_admin")){
      jQuery(this).removeClass("remove_admin");
      jQuery(this).addClass("make_admin");
      jQuery(this).text("make_admin");
    }
    else{
      jQuery(this).removeClass("make_admin");
      jQuery(this).addClass("remove_admin");
      jQuery(this).text("remove_admin");
    }
  });
});
   