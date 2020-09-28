window.editComment = function(commentId){  
    $(`#inputEdit`).html(
    `<input name="replaceComment" type="text" value="" > 
    <button type="button" onclick="updateComment(${commentId})" class= "btn btn-primary" > Edit </button>`
    );
};

window.updateComment = function(commentId){
  const commentBody = $("input[name='replaceComment']").val();

  $.ajax({
    type: "PUT",
    accepts: {"Accept" : "application/json"},
    dataType: 'json',
    url: `${document.location.href}/comments/${commentId}`,
    data: {
      comment: {
        body: commentBody
      }
    },
    success: function(data){
      $(`#${commentId}`).replaceWith(data.comment);
    },
    error: function(jqXHR, textStatus, errorThrown) {
        console.log('AJAX call failed.');
      },
  });
};