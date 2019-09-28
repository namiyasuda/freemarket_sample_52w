$(function() {
  $('#product_delete_btn').click(function(){
    if(!confirm('削除すると二度と復活出来ません。\n削除する代わりに停止することもできます。\n\n本当に削除しますか？')){
      return false;
    }
  });
});