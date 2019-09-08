$(function() {
  // disable auto discover
  Dropzone.autoDiscover = false;

  $("#my-dropzone").dropzone({
    dictDefaultMessage: 'ここにファイルをドラッグ＆ドロップ、または、クリックしてファイルを選択',
    maxFilesize: 10,
    addRemoveLinks: true,
    previewsContainer: '.dz-previews',
    // previewTemplate : $('.preview').html()
  });
  
  // $('body').on('click', function(){
  //   console.log('aaa');
  // });
});