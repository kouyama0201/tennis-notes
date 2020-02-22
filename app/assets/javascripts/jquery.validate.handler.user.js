$(function () {
  // メソッドの定義
  var methods = {
    email: function (value, element) { // メールアドレスの正規表現
      return this.optional(element) || /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/i.test(value);
    },
  }
  // メソッドの追加
  $.each(methods, function (key) {
    $.validator.addMethod(key, this);
  });
  // バリデーションの実行
  $("#new_user").validate({
    // ルール設定
    rules: {
      "user[name]": {
        required: true
      },
      "user[email]": {
        required: true,
        email: true,
      },
      "user[password]": {
        required: true
      },
      "user[password_confirmation]": {
        required: true,
        equalTo: "#user_password",
      },
    },
    // エラーメッセージの定義
    messages: {
      "user[name]": {
        required: "ニックネームを入力してください"
      },
      "user[email]": {
        required: "メールアドレスを入力してください",
        email: "フォーマットが不適切です",
      },
      "user[password]": {
        required: "パスワードを入力してください"
      },
      "user[password_confirmation]": {
        required: "確認用パスワードを入力してください",
        equalTo: "パスワードが一致していません",
      },
    },
    errorClass: "is-invalid",
    errorElement: "p",
    validClass: "is-valid",
  });
  $("#edit_user").validate({
    // ルール設定
    rules: {
      "user[name]": {
        required: true
      },
      "user[password_confirmation]": {
        equalTo: "#user_password"
      },
      "user[current_password]": {
        required: true
      },
    },
    // エラーメッセージの定義
    messages: {
      "user[name]": {
        required: "ニックネームを入力してください"
      },
      "user[password_confirmation]": {
        equalTo: "パスワードが一致していません",
      },
      "user[current_password]": {
        required: "現在のパスワードを入力してください"
      },
    },
    errorClass: "is-invalid",
    errorElement: "p",
    validClass: "is-valid",
  });
  // 入力欄or選択欄をフォーカスアウトしたときにバリデーションを実行(ウィザードページ毎)
  $("#user_name, #user_email, #user_password, #user_password_confirmation, #user_current_password").blur(function () {
    $(this).valid();
  });
});

