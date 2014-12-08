$(document).on 'page:change', ->
  $("a[rel~=popover], .has-popover").popover()
  $('[data-toggle="tooltip"]').tooltip()
