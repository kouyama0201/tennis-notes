$(function () {
  // メソッドの定義
  var methods = {
    day: function (value, element) {
      return this.optional(element) || /^[0-9]{4}\/[0-9]{2}\/[0-9]{2}(\s-\s[0-9]{4}\/[0-9]{2}\/[0-9]{2}|\s[0-9]{2}:[0-9]{2})?$/.test(value);
    },
    minute: function (value, element) {
      return this.optional(element) || /^\d+$/.test(value);
    },
  }
  // メソッドの追加
  $.each(methods, function (key) {
    $.validator.addMethod(key, this);
  });
  // バリデーションの実行
  $("#log-form").validate({
    // ルール設定
    rules: {
      "log[practice_day]": {
        required: true,
        day: true
      },
      "log[serve]": {
        required: true,
        minute: true
      },
      "log[smash]": {
        required: true,
        minute: true
      },
      "log[volley]": {
        required: true,
        minute: true
      },
      "log[stroke]": {
        required: true,
        minute: true
      },
      "log[game]": {
        required: true,
        minute: true
      },
    },
    // エラーメッセージの定義
    messages: {
      "log[practice_day]": {
        required: "入力してください",
        day: "xxxx/xx/xxの形式で入力してください"
      },
      "log[serve]": {
        required: "入力してください",
        minute: "半角数字で入力してください"
      },
      "log[smash]": {
        required: "入力してください",
        minute: "半角数字で入力してください"
      },
      "log[volley]": {
        required: "入力してください",
        minute: "半角数字で入力してください"
      },
      "log[stroke]": {
        required: "入力してください",
        minute: "半角数字で入力してください"
      },
      "log[game]": {
        required: "入力してください",
        minute: "半角数字で入力してください"
      },
    },
    errorClass: "invalid",
    errorElement: "p",
    validClass: "valid",
    // エラーメッセージ表示位置のカスタム設定
    errorPlacement: function (error, element) {
      if (element.attr("name") == "log[practice_day]") {
        error.insertAfter("#log_practice_day_error");
      }
      else {
        error.insertAfter(element);
      }
    }
  });
  // 入力欄or選択欄をフォーカスアウトしたときにバリデーションを実行
  $("#log_practice_day, #log_serve, #log_smash, #log_volley, #log_stroke, #log_game").blur(function () {
    $(this).valid();
  });
});