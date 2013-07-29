$(function(){
  console.log("start live_markdown.js");
  // var textInput = $("#text-area");
  // var textOutput = $('#live_preview');
  $('.text_area').keyup(function(){
    var output = markdown.toHTML($('.text_area').val());
    $('.live_preview').html(output);
    console.log("keyup");

  });

  // function Editor(input, output) {
  //       this.update = function () {
  //         output.innerHTML = markdown.toHTML(input.value);
  //       };
  //       input.editor = this;
  //       this.update();
  //     }
});