$(function() {
  $('.mypage-side-menu__list__item__btn').each(function() {
    var $href = $(this).attr('href');
    if(location.pathname == $href) {
      $(this).parent().addClass('current');
    } else {
      $(this).parent().removeClass('current');
    }
  });
});
  