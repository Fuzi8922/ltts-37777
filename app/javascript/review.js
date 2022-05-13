window.onload = function(){
  $(function () {
    
    /* モーダルウィンドウ準備部分
    $('.login').click(function(){
      $("body").addClass("no_scroll");
      $('#overlay, .modal-window').fadeIn();
    });

    $('.js-close, #overlay').click(function () {
      $('#overlay, .modal-window').fadeOut();
    });
    */
    
    $(document).ready(function(){
      $("h1").fadeIn(1500);
    });

    $(window).scroll(function(){
      $('.fadein').each(function(){
        const elemPos = $(this).offset().top;
        const scroll = $(window).scrollTop();
        const windowHeight = $(window).height();
        if (scroll > elemPos - windowHeight + 100){
            $(this).addClass('scrollin');
        }
      });
    });

    $(window).on('load scroll', function(){
      const scrollPosition = $(window).scrollTop();
      const windowHeight = $(window).height();
      $('.genre, .about, .manufacturer').each(function(){
        const elemPosition = $(this).offset().top;
        if(elemPosition < scrollPosition + windowHeight){
          $(this).css({
            opacity: 1,
            transform: 'translateY(0)'
          });
        }
      });
    });

    
  });
};

