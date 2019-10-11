$(function() {
  $('.category-search').hover(function() {
    $('.category-meun__left').removeClass('active');
  },function() {
  });
  $('.category-meun__left').hover(function() {
  },function() {
  $('.category-meun__left').addClass('active');
  });
});

  // 親カテゴリー選択で子カテゴリーを生成
  $('.category-meun__left__parent').hover(function () {
    var parent_id = $('.category-meun__left__parent option:selected').val();
    if (parent_id.length != 0){
      $('#category-child-1').removeClass('hide');
      disappearSizeBox();
      disapperGrandchild();
      $('#product-brand').removeClass('hide');
      $.ajax({
        url: '/tops/downlist_children',
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
      disapperGrandchild();
    }
  });
