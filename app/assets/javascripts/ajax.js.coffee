$(document).ready ->
  $("a[data-remote|='true']").on('ajax:success', (e, data, status, xhr) ->
    $('#ajaxTarget').html xhr.responseText
    window.scrollTo(window.scrollX, 0)
  )
