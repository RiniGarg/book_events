jQuery(document).on('ready',function(){
  eventJs.submitForm();
  jQuery('#filter_category').submit(function() { 
      jQuery.ajax({
        url: jQuery(this).attr("action"),
        data: jQuery("#category_category_id").val(),
        type: "POST"

         });
   });
});

var eventJs = {
  submitForm: function(){
    jQuery('#events_category_list').change(function() {
    this.form.submit();
  });
  }
};