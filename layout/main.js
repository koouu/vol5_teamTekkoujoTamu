//fixedの縦マージンとる
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
