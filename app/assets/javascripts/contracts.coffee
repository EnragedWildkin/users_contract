class @ContractNew
  constructor: ->
    initFunc()

initFunc = ->
  # Set contract_pdf field to true if press button "Generate PDF"
  $('.generate_pdf').click (e)->
    e.preventDefault()
    $('#contract_pdf').val 'true'
    $('form').submit()
  $('.preview').click ->
    $('#contract_pdf').val 'false'

  # Don't show end_date field on NDA templates
  fields_without_end_date = [
    'NDA-LLC-draft-Ukraine',
    'NDA-LLC-draft_Russia'
  ]
  $('#contract_draft_id').change ->
    if $.inArray($('#contract_draft_id').find('option:selected').text(), fields_without_end_date) >= 0
      $('#contract_end_date').val ''
      $('#contract_end_date').attr('required', false)
      $('.contract_end_date').hide('slow')
    else
      $('.contract_end_date').show('slow')
      $('#contract_end_date').attr('required', true)

  # Don't show Consulting-Services-draft fields when generate another draft type
  showConsultingFields()
  $('#contract_draft_id').change ->
    showConsultingFields()

showConsultingFields = ->
  consulting_draft = 'Consulting-Services-draft'
  if $('#contract_draft_id').find('option:selected').text() == consulting_draft
    $('.consulting_fields').show('slow')
  else
    $('.consulting_fields').hide('slow')
