document.addEventListener('turbolinks:load', function (){
  $(function(){
    var open = $('.modal-open'),
        close = $('.modal-close'),
        body = $('.modal-body'),
        container = $('.modal-container');

    open.on('click', function(){
      body.addClass('active');
      container.addClass('active');
      return false;
    });

    close.on('click', function(){
      body.removeClass('active');
      container.removeClass('active');
    });

    $(document).on('click', function(e) {
        if(!$(e.target).closest('.modal-body').length){
          body.removeClass('active');
          container.removeClass('active');
        }
    });
  });
});