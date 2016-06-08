$ ->
  $('.generate_pdf').click (e)->
    e.preventDefault()
    $('#contract_pdf').val 'true'
    $('form').submit()
  $('.preview').click ->
    $('#contract_pdf').val 'false'

# Don't show end_date field on NDA templates
  hide_fields = ['3','4']
  $('#contract_draft_id').change ->
    if $.inArray($('#contract_draft_id').val(), hide_fields) >= 0
      $('#contract_end_date').val ''
      $('#contract_end_date').attr('required', false)
      $('.contract_end_date').hide('slow')
    else
      $('.contract_end_date').show('slow')
      $('#contract_end_date').attr('required', true)
