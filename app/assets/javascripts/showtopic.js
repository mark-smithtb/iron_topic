$(document).ready(function()
{
  $('.title').click(function(e)
  {
    e.preventDefault()
    var topic_id = $(this).data('topic')

    $.ajax('/topics/', {
      method: 'GET',
      data : {
        id: topic_id
      }
    });
  });
});
