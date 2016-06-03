$(document).ready ->
  $('.generate_pdf').click (e)->
    e.preventDefault()
    $('#contract_pdf').val 'true'
    $('form').submit()
