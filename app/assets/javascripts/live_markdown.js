

$(function(){
  var converter = new Showdown.converter();
  markParser();
  function markParser (){

    var output = converter.makeHtml($('.text_area').val());
    output.replace(/>/g, ">\n");
    output.replace(/</g, "\n<");
    output.replace(/\n{2,}/g, "\n\n");
    $('.live_preview').html(output);
  }
  $('.text_area').keyup(markParser);
});