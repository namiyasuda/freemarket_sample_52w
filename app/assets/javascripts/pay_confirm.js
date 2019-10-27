$(function() {
  $('#payment_btn').click(function(){
    if(!confirm('本当に購入しますか？')){
      return false;
    }
  });
});