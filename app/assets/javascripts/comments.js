$(function(){
  $('.comment_submit').click(function(event){
    if ($('#comment_body').val() === "")
      event.preventDefault();
    {
      $(".new_comment_form").append("<h3 class='error'>Please enter a comment.</h3>")
    }
  })
  // upvote and downvote logic
  $('.upvote').click(function(event){
    event.preventDefault();
    var karma = parseInt(($('.upvote').attr('data')));
    $('.comment_karma_count').text("Karma: " + (karma + 1));
  })
});
