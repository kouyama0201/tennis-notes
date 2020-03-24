$(function() { // 合計練習時間の計算
  $('.form-upper__left__times').on('input', function () {
    var serve = $('#log_serve').val();
    var smash = $('#log_smash').val();
    var volley = $('#log_volley').val();
    var stroke = $('#log_stroke').val();
    var game = $('#log_game').val();
    var se = parseInt(serve);
    var sm = parseInt(smash);
    var vo = parseInt(volley);
    var st = parseInt(stroke);
    var ga = parseInt(game);
    var result = se + sm + vo + st + ga 
    if(isNaN(result) || result >= 1000000) {
      $('.form-upper__left__times__total--minutes').html('');
      return false;
    }
    $('.form-upper__left__times__total--minutes').html(result.toLocaleString())
  });
});
