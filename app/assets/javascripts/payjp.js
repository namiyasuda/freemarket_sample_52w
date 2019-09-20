$(document).on('turbolinks:load', function() {
  let form = $("#charge-form");
  Payjp.setPublicKey('pk_test_70d52ef41d3ca47b27f10d99');
  $(document).on("click", "#token_submit", function(e) {

    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    let card = {
        number: $("#card_number").val(),
        cvc: $("#cvc").val(),
        exp_month: $("#exp_month").val(),
        exp_year: $("#exp_year").val(),
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert('トークン作成エラー発生');
      }
      else {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        let token = response.id;

        form.append($('<input type="hidden" name="payjp-token" />').val(token));
        form.get(0).submit();
      }
    });
  });
});