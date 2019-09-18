$(function(){
  // 配送方法ボックスのオプションを作成
  function appendOption(method){
    var html = `<option value="${method.id}">${method.name}</option>`;
    return html;
  }
// 配送料の負担を選択で配送方法を表示させる
  $('#paying-side-selection').change(function () {
    var paySide_id = $('#paying-side-selection option:selected').val();
    if (paySide_id.length != 0){
      $('#delivery-method-box').removeClass('hide');
      $.ajax({
        url: 'get_delivery_method',
        type: 'Get',
        data: {paySide_id: paySide_id},
        dataType: 'json'
      }).done(function(delivery_methods){
        $('#delivery-method-selection option').remove();
        var insertHTML = `<option value="">---</option>`;
        delivery_methods.forEach(function(delivery_method){
          insertHTML += appendOption(delivery_method);
        })
        $('#delivery-method-selection').append(insertHTML);        
      }).fail(function(){
        alert('配送方法の取得に失敗しました');
      })
    } else {
      $('#delivery-method-box').addClass('hide');
    }
  });
});