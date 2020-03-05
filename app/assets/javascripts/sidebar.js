$(window).on('load', function () { // 各ページでのサイドバーのボタン色変え
  if (document.URL.match("logs/new")) {
    $(".new").css("background-color", "#EEEEEE");
  } else if (document.URL.match(/\/logs\/\d+\/edit/)) {
  } else if (document.URL.match(/\/users\/\d+\/following/)) {
    $(".following").css("background-color", "#EEEEEE");
  } else if (document.URL.match(/\/users\/\d+\/followers/)) {
    $(".followers").css("background-color", "#EEEEEE");
  } else if (document.URL.match(/\/users\/\d/)) {
    $(".user").css("background-color", "#EEEEEE");
  } else if (document.URL.match("users/edit")) {
    $(".user-edit").css("background-color", "#EEEEEE");
  } else {
    $(".top").css("background-color", "#EEEEEE");
  }
});
