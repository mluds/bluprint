$(document).ready ->
  $("li a[data-remote|='true'], a[data-remote|='true'].btn").on(
    'ajax:success',
    (e, data, status, xhr) ->
      $('#ajaxTarget').html xhr.responseText
      window.scrollTo(window.scrollX, 0)
  )
