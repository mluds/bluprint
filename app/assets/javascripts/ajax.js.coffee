$(document).ready ->
  $("#ajaxLink").on("ajax:success", (e, data, status, xhr) ->
    $("#ajaxTarget").html xhr.responseText
  )
