$(function() {
	$('.tab--notice-todo').click(function(){
		$('.active--notice-todo').removeClass('active--notice-todo');
		$(this).addClass('active--notice-todo');
		$('.show--notice-todo').removeClass('show--notice-todo');
		let index = $(this).index();
		$('.tab-contents--notice-todo').eq(index).addClass('show--notice-todo');
  });
  
	$('.tab--purchased').click(function(){
		$('.active--purchased').removeClass('active--purchased');
		$(this).addClass('active--purchased');
		$('.show--purchased').removeClass('show--purchased');
		let index = $(this).index();
		$('.tab-contents--purchased').eq(index).addClass('show--purchased');
	});
});