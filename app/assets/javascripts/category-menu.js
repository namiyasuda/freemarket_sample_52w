$(function() {
  $('.category-search').hover(function() {
    $('.category-meun__left').removeClass('active');
  },function() {
  });
  $('.category-meun__left').hover(function() {
  },function() {
  $('.category-meun__left').addClass('active');
  });
});

$(function(){
	$('.category-meun__left').on({
		'mouseenter' : function(){
			$('.category-meun__center').removeClass('active');
		},
		'mouseleave' : function(){
			$('.category-meun__center').addClass('active');
		}
	});
})
