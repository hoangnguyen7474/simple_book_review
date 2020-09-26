window.submitReview = function(){
  const commentBody = $("input[name='body']").val();

  $.ajax({
    type: "POST",
    accept: {"Accept" : "application/json"},
    dataType: 'json',    
    url: `${document.location.href}/comments`,
    data:{
      comment: {
        body : commentBody
      }
    },
    success:function(data){
      $("#comment-pane").append(data.comment)
    },
    error: function(jqXHR, textStatus, errorThrown) {
        console.log('AJAX call failed.');
      },
  });
};