$(function() {
  $('.evaluation__body__form__submit').on('click', function (){
    if (!$('input:radio[name="product[evaluation]"]:checked').val()) {
      $('.evaluation__body__form__alert').removeClass('hide');
    }
  })
})