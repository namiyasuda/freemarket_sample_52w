$(function(){
  let TagSalesPrice = $('#sales-price');
  let TagSalesFee = $('#sales-fee');
  let TagSalseProfit = $('#sales-profit');

  function CalcPrice() {
    //入力がない場合は-に、戻す。
    if (TagSalesPrice.val() < 300 || TagSalesPrice.val() > 9999999) {
      TagSalesFee.text('-');
      TagSalseProfit.text('-');
    } else {
      let SalsePrice = TagSalesPrice.val();
      let SalesFee = String(Math.floor(SalsePrice * 0.1)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      let SalesProfit = String(Math.ceil(SalsePrice * 0.9)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      TagSalesFee.text('¥' + SalesFee);
      TagSalseProfit.text('¥' + SalesProfit);
    }
  }
  
  TagSalesPrice.on('change', function() {
    CalcPrice();
  });

  $(window).on('load', function() {
    if ( document.URL.match(/^(?=.*products)(?=.*edit)/)){
      CalcPrice();
    } 
  });
});