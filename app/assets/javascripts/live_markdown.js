

$(function(){
  console.log("start live_markdown.js");
  // var Showdown = require('showdown');
  var converter = new Showdown.converter();
  // var textInput = $("#text-area");
  // var textOutput = $('#live_preview');
  $('.text_area').keyup(function(){
    var output = converter.makeHtml($('.text_area').val());
    // output = output.replace(/&/g, '&amp;');
    // output = output.replace(/</g, '&lt;');
    // output = output.replace(/>/g, '&gt;');

    output.replace(/>/g, ">\n");
    output.replace(/</g, "\n<");
    output.replace(/\n{2,}/g, "\n\n");
    $('.live_preview').html(output);
    // .replace(/</g, "\n<").replace(/\n{2,}/g, "\n\n");
    console.log("keyup");

  });
});