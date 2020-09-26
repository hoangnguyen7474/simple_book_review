window.deleteComment = function(commentId){

  $.ajax({
    type: "DELETE",
    accepts: {
      "Accept" : "application/json"
    },
    dataType: 'json',
    url: `${document.location.href}/comments/${commentId}`,
    data: {},
    success: function(data){
      $(`#${commentId}`).remove();
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log('AJAX call failed')
    },
  });
};