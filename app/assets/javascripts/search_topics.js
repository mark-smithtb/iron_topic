$(document).ready(function()
{
$('#search-bar').submit(function()
{
  var q = $('.search-field');
  var scope = $('.search-select');

  $.ajax('/topics/search', {
    method: 'GET',
    data : {
      q: q
      scope: scope
    }
  });
});
});
