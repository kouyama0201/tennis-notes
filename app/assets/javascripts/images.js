$(function(){
  //プレビューのhtmlを定義
  function buildHTML(count) {
    var html = `<div class="log-image" id="prev-box__${count}">
                  <img src="" height="275" width="275">
                  <div class="log-image__delete-btn" id="delete_btn_${count}">
                    <i class="far fa-times-circle"></i>
                  </div>
                </div>`
    $('.form-lower__image-field').before(html);
  }

  // 投稿編集時
  //logs/:i/editページへリンクした際のアクション=======================================
  if (window.location.href.match(/\/logs\/\d+\/edit/)){
    //プレビューにidを追加
    $('.log-image').each(function(index, box){
      $(box).attr('id', `prev-box__${index}`);
    })
    //削除ボタンにidを追加
    $('.log-image__delete').each(function(index, box){
      $(box).attr('id', `delete_btn_${index}`);
    })
  }
  //=============================================================================

  // プレビューの追加
  $(document).on('change', '.form-lower__image-field--input', function() {
    //image-fieldのidの数値のみ取得
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    var count = $('.log-image').length
    //labelのidとforを更新
    $('.form-lower__image-field').attr({id: `image-field--${count}`,for: `log_images_attributes_${id}_image`});
    //選択したfileのオブジェクトを取得
    var file = this.files[0];
    var reader = new FileReader();
    //readAsDataURLで指定したFileオブジェクトを読み込む
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function() {
      var image = this.result;
      //プレビューが元々なかった場合はhtmlを追加
      if ($(`#prev-box__${id}`).length == 0) {
        var html = buildHTML(id);
        //labelの直前のプレビュー群にプレビューを追加
        var prevContent = $('.form-lower__image-content').prev();
        $(prevContent).append(html);
      }
      //イメージを追加
      $(`#prev-box__${id} img`).attr('src', `${image}`);

      //プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す=============
      if ($(`#log_images_attributes_${id}__destroy`)){
        $(`#log_images_attributes_${id}__destroy`).prop('checked',false);
      } 
      //=============================================================================

      //labelのidとforの値を変更
      var count = $('.log-image').length
      $('.form-lower__image-field').attr({id: `image-field--${count}`,for: `log_images_attributes_${count}_image`});
    }
  });

  // 画像の削除
  $(document).on('click', '.log-image__delete-btn', function() {
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    $(`#prev-box__${id}`).remove();

    //新規登録時と編集時の場合分け==========================================================

    //新規投稿時
    //削除用チェックボックスの有無で判定
    if ($(`#log_images_attributes_${id}__destroy`).length == 0) {
      //フォームの中身を削除 
      $(`#log_images_attributes_${id}_image`).val("");

      var count = $('.form-lower__image-field').length
      $('.form-lower__image-field').attr({id: `image-field--${count}`, for: `log_images_attributes_${id}_image`});

    } else {
    //投稿編集時
      $(`#log_images_attributes_${id}__destroy`).prop('checked',true);

    //削除したプレビューのidによって、ラベルのidを変更する
      var count = $('.log-image').length
      $('.form-lower__image-field').attr({id: `image-field--${count}`,for: `log_images_attributes_${id}_image`});
    }
    //=============================================================================
  });
});
