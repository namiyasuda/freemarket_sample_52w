$(function() {
  $('.evaluation__body__form__submit').on('click', function (){
    if ($('.evaluation-radio-btn').prop("checked" )== false) {
      $('.evaluation__body__form__alert').removeClass('hide');
    }
  })
})