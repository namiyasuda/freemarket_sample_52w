$(function(){
  // カテゴリーボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  
  // サイズセレクトボックスのオプションを作成
  function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.name}</option>`;
    return html;
  }

  // サイズボックスを隠す・valを消す・バリデーションを消す
  function disappearSizeBox() {
    $('#product-size').addClass('hide');
    $('#select-size option:selected').val('');
    $('#select-size').removeAttr('required');
  }

  // サイズボックスを表示させる
  function appearSizeBox(category_id){
    if (category_id != 0){
      $.ajax({
        url: 'get_size',
        type: 'Get',
        data: {category_id: category_id},
        dataType: 'json'
      }).done(function(sizes){
        if (sizes.length != 0){
          $('#select-size option').remove();
          $('#product-size').removeClass('hide');
          $('#select-size').attr('required', 'required');
          var insertHTML = `<option value="">---</option>`;
          sizes.forEach(function(size){
            insertHTML += appendSizeOption(size);
          })
          $('#select-size').append(insertHTML);
        } else {
          disappearSizeBox();
        }
      }).fail(function(){
        alert('サイズ取得に失敗しました');
      })
    } else {
      disappearSizeBox();
    }
  }

  // 親カテゴリー選択で子カテゴリーを生成
  $('#parent_category').change(function () {
    var parent_id = $('#parent_category option:selected').val();
    if (parent_id.length != 0){
      $('#category-child-1').removeClass('hide');
      disappearSizeBox();
      $('#product-brand').removeClass('hide');
      $.ajax({
        url: 'get_category_children',
        type: 'Get',
        data: {parent_id: parent_id},
        dataType: 'json'
      }).done(function(children){
        $('#category-child-1 option').remove();
        $('#category-child-2 option').remove();
        var insertHTML = `<option value="">---</option>`;
        children.forEach(function(child){
          insertHTML += appendOption(child);
        })
        $('#child_category').append(insertHTML);        
      }).fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#category-child-1').addClass('hide');
      $('#category-child-2').addClass('hide');
    }
  });
  
// 子カテゴリー選択で孫カテゴリー生成
  $('#child_category').change(function () {
    var child_id = $('#child_category option:selected').val();
    if (child_id.length != 0){
      $('#category-child-2').removeClass('hide');
      disappearSizeBox();
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'Get',
        data: {child_id: child_id},
        dataType: 'json'
      }).done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#category-child-2 option').remove();
          var insertHTML = `<option value="">---</option>`;
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          })
          $('#grandchild_category').append(insertHTML);
        } else {   //孫カテゴリーがない場合はサイズを表示させる
          $('#category-child-2').addClass('hide');
          appearSizeBox(child_id);
        }
      }).fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#category-child-2').addClass('hide');
    }
  });

    // 孫カテゴリー選択でサイズレクトボックス生成
    $('#grandchild_category').change(function(){
      var grandchild_id = $('#grandchild_category option:selected').val();
      appearSizeBox(grandchild_id);
    });

})