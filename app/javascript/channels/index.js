// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
$(function() {
    var height=$("#header").height();
    var height2=$("#home-cr").height();
    $("body").css("margin-top", height);
    $("#home").css("margin-top", height2+40);
  });
  //投稿画面分のマージンをとる
$(function() {
    var width=$("#child2").width();
    $("#child1").css("margin-right", width);
    $("footer").css("margin-right", width);
  });