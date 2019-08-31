$(function(){
  let TagSalesPrice = $('#sales-price');
  let TagSalesFee = $('#sales-fee');
  let TagSalseProfit = $('#sales-profit');
  
  TagSalesPrice.on('change', function () {
    let SalsePrice = $(this).val();
    let SalesFee = String((SalsePrice * 0.1)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    let SalesProfit = String((SalsePrice * 0.9)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
    TagSalesFee.text('¥' + SalesFee);
    TagSalseProfit.text('¥' + SalesProfit);
  });
});