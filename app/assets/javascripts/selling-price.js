$(function(){
  let TagSalesPrice = $('#sales-price');
  let TagSalesFee = $('#sales-fee');
  let TagSalseProfit = $('#sales-profit');
  
  TagSalesPrice.on('change', function () {
    let SalsePrice = $(this).val();
    let SalesFee = String(Math.floor(SalsePrice * 0.1)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    let SalesProfit = String(Math.ceil(SalsePrice * 0.9)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    TagSalesFee.text('¥' + SalesFee);
    TagSalseProfit.text('¥' + SalesProfit);
    //入力がない場合は-に、戻す。
    if ($(this).val().length == 0) {
      TagSalesFee.text('-');
      TagSalseProfit.text('-');
    }
  });
});