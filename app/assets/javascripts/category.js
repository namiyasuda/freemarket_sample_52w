$(function(){
  // カテゴリーセレクションにオプションを追加する関数を定義
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  // 親カテゴリー選択で子カテゴリーを生成
  $('#parent_category').change(function () {
    var parent_id = $('#parent_category option:selected').val();
    if (parent_id.length != 0){
      $('#category-child-1').removeClass('hide');
      $('#product-size').addClass('hide');
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
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'Get',
        data: {child_id: child_id},
        dataType: 'json'
      }).done(function(grandchildren){
        $('#category-child-2 option').remove();
        var insertHTML = `<option value="">---</option>`;
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        })
        $('#grandchild_category').append(insertHTML);
      }).fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#category-child-2').addClass('hide');
    }
  });
  
  // 孫カテゴリー選択でサイズセレクトボックスを表示
  $('#grandchild_category').change(function(){
    var grandchild_id = $('#grandchild_category option:selected').val();
    if ((grandchild_id >= 3 && grandchild_id <= 80) || (grandchild_id >= 202 && grandchild_id <= 247)){
      $('#product-size').removeClass('hide');
    }
  })
})