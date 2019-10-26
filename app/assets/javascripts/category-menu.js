$(function() {
  let left_index;
  let center_index;
  let center_children_index;
  let index;
  // 親要素を表示する
  $('.category-search').hover(function() {
    $('.category-search span').css('color','#0099e8')
    $('.category-meun__left').removeClass('hide');
    $('.category-meun__center').addClass('hide');
    $('.category-meun__right').addClass('hide');
  },function(){
  });
  // 親要素を非表示にする 
  $('.category-meun').hover(function() {
  },function() {
    $('.category-meun__left').addClass('hide');
    $('.category-meun__center').addClass('hide');
    $('.category-meun__right').addClass('hide');
    $('.category-search span').css('color','')
  });
  // 子要素を表示する
  $('.category-meun__left__parent').hover(function() {
    left_index = $(this).index();
    $('.category-meun__center').removeClass('hide');
    $('.category-meun__center__parent').eq(left_index).removeClass('hide');
    $('.category-meun__right').addClass('hide');
  },function() {
    $('.category-meun__center__parent').eq(left_index).addClass('hide');
    $('.category-meun__center').addClass('hide');
  });
  
  $('.category-meun__center__children').hover(function() {
    center_index = $(this).parent().index();
    $('.category-meun__center__parent').eq(center_index).removeClass('hide');
    $('.category-meun__right').removeClass('hide');
    $('.category-meun__center').removeClass('hide');
    center_children_index = $(this).index();
    $('.category-meun__right__parent').eq(center_index).children().eq(center_children_index).removeClass('hide');
  },function() {
    $('.category-meun__right__parent').eq(center_index).children().eq(center_children_index).addClass('hide');
    $('.category-meun__right').addClass('hide');
  });

  $('.category-meun__center__parent').hover(function() {
    index = $(this).index();
    $('.category-meun__left__parent').eq(index).css({'background-color':'#ea352d','color':'#fff'});
    $('.category-meun__center__parent').eq(index).removeClass('hide');
    $('.category-meun__center').removeClass('hide');
  },function() {
    $('.category-meun__center__parent').eq(index).addClass('hide');
    $('.category-meun__center').addClass('hide');
    $('.category-meun__left__parent').eq(index).css({'background-color':'','color':''});
  });

  $('.category-meun__right__parent').hover(function() {
    $('.category-meun__left__parent').eq(index).css({'background-color':'#ea352d','color':'#fff'});
    $('.category-meun__center__parent').eq(center_index).removeClass('hide');
    $('.category-meun__right').removeClass('hide');
    $('.category-meun__center').removeClass('hide');
    $('.category-meun__right__parent').eq(center_index).children().eq(center_children_index).removeClass('hide');
  },function() {
    $('.category-meun__right__parent').eq(center_index).children().eq(center_children_index).addClass('hide');
    $('.category-meun__right').addClass('hide');
    $('.category-meun__left__parent').eq(index).css({'background-color':'','color':''});
  });

  $('.category-meun__right__grandchildren').hover(function() {
    $('.category-meun__center__parent').eq(center_index).removeClass('hide');
    $('.category-meun__center__parent').eq(center_index).children().eq(center_children_index).css('background-color','#eee');
    $('.category-meun__right').removeClass('hide');
    $('.category-meun__center').removeClass('hide');
    $('.category-meun__right__parent').eq(center_index).children().eq(center_children_index).removeClass('hide');
  },function() {
    $('.category-meun__center__parent').eq(center_index).children().eq(center_children_index).css('background-color','');
  });
  
});