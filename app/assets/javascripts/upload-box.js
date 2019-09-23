// 現在凍結中。ドラック＆ドロップ機能

// $(function() {
//   // disable auto discover
//   Dropzone.autoDiscover = false;

//   $("#my-dropzone").dropzone({
//     dictDefaultMessage: 'ここにファイルをドラッグ＆ドロップ、または、クリックしてファイルを選択',
//     maxFilesize: 10,
//     addRemoveLinks: true,
//     previewsContainer: '.dz-previews',
//     // previewTemplate : $('.preview').html()
//   });
  
//   // $('body').on('click', function(){
//   //   console.log('aaa');
//    });
// });

$(function() {  
  var image_count = 1;
  // var have_item_num = ;

  // プレビュー画像HTMLを生成する
  function buildPreviewHTML(e, order) {
    var html = `<li class='upload-box__body__item'>
                  <div class='upload-box__body__item__figure'>
                    <img src='${e.target.result}' class='img-prev' data-image=${order}>
                  </div>
                  <div class='upload-box__body__item__button'>
                    <a class='upload-box__body__item__button__edit'>編集</a>
                    <a class='upload-box__body__item__button__delete' data-image=${order}>削除</a>
                  </div>
                </li>`;
    return html;
  }

  // インプットボックスを生成する
  function buildInputImageBox(order){
    var html = `<div class="upload-box__body__drop-box have-item-${$('.upload-box__body').find('li.upload-box__body__item').length + 1}">
                  <input name="images[image][]" id="upload-image${order}" class="upload-image" type="file">
                  <div class="upload-box__body__drop-box__text">
                    クリックしてファイルをアップロード
                  </div>
                </div>`
    return html
  }

  // アイテムコンテナーを生成する
  function buildItemContainer(order){
    var html = `<ul class="upload-box__body__items #item-container2"></ul>`
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
      if ($('#item-container2').children().length < 4) {
        $('.upload-box__body').append(buildInputImageBox(image_count+input.files.length));
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
    target_list.remove();
    $('#upload-image'+target_upload_num).parent().remove();
    // 10枚目の画像を消すとインプットボックスがなくなる
    if ($('.upload-box__body').find('li.upload-box__body__item').length == 9){
      $('.upload-box__body').append(buildInputImageBox(5));
    }
  })
})