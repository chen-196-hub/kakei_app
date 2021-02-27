document.addEventListener("turbolinks:load", function() {
  $(function () {
    $('.js-btn').on('click', function () {        // js-btnクラスをクリックすると、
      $('.menu , .btn , .btn-line').toggleClass('open'); // メニューとバーガーの線にopenクラスをつけ外しする
    })
  });
  $(function(){
    setTimeout("$('.time-limit').fadeOut('slow')", 5000) 
  })
});
