$(function(){
  var converter = new Showdown.converter();

  if ($('.live_preview').length > 0){
    markParser();
  }
  function markParser (){

    var output = converter.makeHtml($('.text_area').val());
    $('.live_preview').html(output);
  }
  $('.text_area').keyup(markParser);
});