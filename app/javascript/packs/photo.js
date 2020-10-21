$(document).on("turbolinks:load", () => {
  if ($('.upload-hider-labels').length > 0){
        $('.upload-hider-labels').each(function(){
          return $(this).closest('.form-group').find('.upload-hider-fields').hide();
        });
  }

  $('form').on('click','.replace-upload', function(e) {
    var uploadFields, uploadLabels;
    e.preventDefault();
    uploadLabels = $(this).closest('.upload-hider-labels');
    uploadFields = $(this).closest('.form-group').find('.upload-hider-fields');
    uploadLabels.hide();
    return uploadFields.show();
  });
})