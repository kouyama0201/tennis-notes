$(window).on('load', function () { // 各ページでのサイドバーのボタン色変え
  if (document.URL.match("logs/new")) {
    $(".new").css("background-color", "#CCCCCC");
  } else if (document.URL.match(/\/logs\/\d+\/edit/)) {
  } else if (document.URL.match(/\/users\/\d+\/like/)) {
    $(".like").css("background-color", "#CCCCCC");
  } else if (document.URL.match(/\/users\/\d+\/following/)) {
    $(".following").css("background-color", "#CCCCCC");
  } else if (document.URL.match(/\/users\/\d+\/followers/)) {
    $(".followers").css("background-color", "#CCCCCC");
  } else if (document.URL.match(/\/users\/\d/)) {
    $(".user").css("background-color", "#CCCCCC");
  } else if (document.URL.match("users/edit")) {
    $(".user-edit").css("background-color", "#CCCCCC");
  } else if (document.URL.match("users")) {
    $(".users").css("background-color", "#CCCCCC");
  } else if (document.URL.match("invites/new")) {
    $(".new-invite").css("background-color", "#CCCCCC");
  } else if (document.URL.match("invites")) {
    $(".invites").css("background-color", "#CCCCCC");
  } else {
    $(".top").css("background-color", "#CCCCCC");
  }
});
