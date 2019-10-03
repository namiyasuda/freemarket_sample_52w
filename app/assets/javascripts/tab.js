$(function() {
	$('.tab--notice-todo').click(function(){
		$('.active--notice-todo').removeClass('active--notice-todo');
		$(this).addClass('active--notice-todo');
		$('.show--notice-todo').removeClass('show--notice-todo');
		let index = $(this).index();
		$('.tab-contents--notice-todo').eq(index).addClass('show--notice-todo');
  });
  
	$('.tab--bought').click(function(){
		$('.active--bought').removeClass('active--bought');
		$(this).addClass('active--bought');
		$('.show--bought').removeClass('show--bought');
		let index = $(this).index();
		$('.tab-contents--bought').eq(index).addClass('show--bought');
	});
});