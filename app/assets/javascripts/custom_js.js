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
      jQuery(this).text("Make Admin");
    }
    else{
      jQuery(this).removeClass("make_admin");
      jQuery(this).addClass("remove_admin");
      jQuery(this).text("Remove Admin");
    }
  });
});

var passValidation = {
  checkSubmit: function(){ $('#edit_pass').on('submit', function () {
    if($('#user_password').val() == ""){
        return false;
    }
    else if($('#user_password').val().length < 6){
      return false;
    } 
    else if($('#user_password').val() != $('#user_password_confirmation').val()){
      return false;
    }
    else {
        return true;
    }
  });
}
};