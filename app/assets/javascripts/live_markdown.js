$(function(){
  var converter = new Showdown.converter();
  markParser();
  function markParser (){

    var output = converter.makeHtml($('.text_area').val());
    $('.live_preview').html(output);
  }
  $('.text_area').keyup(markParser);
});