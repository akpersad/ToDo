$(function(){
  $("form").submit(function(event){
    event.preventDefault();

    var action = $(this).attr('action');
    var method = $(this).attr('method');

    var name = $(this).find('#item_name').val();
    var data = $(this).serializeArray();

    $.ajax({
      method: method,
      url: action,
      data: data
      dataType: "script"
    });

  });
});