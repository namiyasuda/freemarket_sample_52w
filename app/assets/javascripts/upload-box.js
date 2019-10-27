$(function() {  
  var saved_image_num = $('.upload-box__body').data('num'); //DBに保存してある画像の数
  var image_count = saved_image_num + 1;  //アップロードされた画像の通し番号

  // プレビュー画像HTMLを生成する
  function buildPreviewHTML(e, image_count) {
    var html = `<li class='upload-box__body__item'>
                  <div class='upload-box__body__item__figure'>
                    <img src='${e.target.result}' class='img-prev' data-image=${image_count}>
                  </div>
                  <div class='upload-box__body__item__button'>
                    <span class='upoad-box__body__item__button__edit'>編集</span>
                    <span class='upload-box__body__item__button__delete' data-image=${image_count}>削除</span>
                  </div>
                </li>`;
    return html;
  }

  // アップロードボックスを生成する
  function buildInputImageBox(image_count){
    var html = `<div class="upload-box__body__drop-box have-item-${$('.upload-box__body__item').length+1}" data-image=${image_count}>
                  <input name="images[image][]" id="upload-image${image_count}" class="upload-image" type="file">
                  <div class="upload-box__body__drop-box__text">
                    クリックしてファイルをアップロード
                  </div>
                </div>`
    return html
  }

  // 選択されたファイルをプレビューを作成
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        var insertHTML = buildPreviewHTML(e, image_count);
        if (($('#item-container1').children().length) < 5) {
          $('#item-container1').append(insertHTML);
        } else {
          $('#item-container2').removeClass('hide');
          $('#item-container2').append(insertHTML);
        }
        image_count += 1;
      }
      reader.readAsDataURL(input.files[0]);
      // 新しいインプットボックスを生成
      $(input).parent().addClass('hide');
      $('.upload-box__body').append(buildInputImageBox(image_count+input.files.length));
      if ($('#item-container2').children().length == 4) {
        $('.upload-box__body__drop-box').last().addClass('hide');
      }
    }
  }
  
  // 選択されたファイルをプレビュー表示
  $(document).on('change', '.upload-image', function(){
    readURL(this);
  });
  
  // プレビュー画像の削除
  $(document).on('click', '.upload-box__body__item__button__delete', function() {
    var target_list = $(this).parent().parent();
    var target_upload_num = $(this).attr('data-image');

    // プレビュー画像表示ボックスを削除する
    target_list.remove();  
    // 削除する画像が、保存済みか追加したものかで条件分岐
    if (target_upload_num <= saved_image_num) {
      // 保存済みの場合、対応する配列要素の値を0にする
      $('#saved-image-'+target_upload_num).val(0);
    } else {
      // 追加したものの場合、削除画像と同じ番号のアップロードボックスを削除する
      $(".upload-box__body__drop-box").each(function(index, element){
        if ($(element).data('image')==target_upload_num) {
          $(element).remove();
        }
      });
    }
    // 現在表示中のupload-boxの大きさを調整するためクラス名を削除・追加
    $('.upload-box__body__drop-box').last().removeClass(function(index, className) {
      return (className.match(/\bhave-item-\S+/g) || []).join(' ');
    });
    $('.upload-box__body__drop-box').last().addClass('have-item-'+$('.upload-box__body__item').length);
    // 削除した時に上の段に移動させる
    if ($('#item-container2 li').length > 0 && $('#item-container1 li').length < 5){
      $('#item-container1').append($('#item-container2 li').first());
    }
    // 10枚目の画像を消した時はインプットボックを表示させる
    if ($('.upload-box__body__item').length == 9){
      $('.upload-box__body__drop-box').last().removeClass('hide');
    }
    // 画像を全て削除した場合はバリデーションをかける
    if ($('.upload-box__body__item').length == 0){
      $('.upload-image').last().attr('required', 'required');
    }
  })
})