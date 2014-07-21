ready = ->
  $('select').each ->
    $(this).selectpicker()

$(document).ready(ready)
$(document).on('page:load', ready)
