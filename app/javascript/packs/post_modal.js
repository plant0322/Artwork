document.addEventListener('turbolinks:load', function (){
  $(function(){
    var open = $('.modal-open'),
        close = $('.modal-close'),
        container = $('.modal-container');

    open.on('click', function(){
      container.addClass('active');
      return false;
    });

    close.on('click', function(){
      container.removeClass('active');
    });

    $(document).on('click', function(e) {
        if(!$(e.target).closest('.modal-body').length){
          container.removeClass('active');
        }
    });
  });
});