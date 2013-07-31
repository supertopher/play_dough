$(function(){
  $('.comment_submit').click(function(event){
    if ($('#comment_body').val() === "")
    {
      event.preventDefault();
      $(".new_comment_form").append("<h3 class='error'>Please enter a comment.</h3>")
    }
  })
});
