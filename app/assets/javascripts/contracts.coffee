class @ContractNew
  constructor: ->
    initFunc()

initFunc = ->
  initVariables()
  hideEndDate()
  showConsultingFields()
  $('#contract_draft_id').change ->
    showConsultingFields()

initVariables = ->
  @.consulting_draft = 'Consulting-Services-draft'
  @.fields_without_end_date = [
    'NDA-LLC-draft-Ukraine',
    'NDA-LLC-draft_Russia'
  ]

# Don't show end_date field on NDA templates
hideEndDate = ->
  $('#contract_draft_id').change ->
    if $.inArray($('#contract_draft_id').find('option:selected').text(), fields_without_end_date) >= 0
      $('.contract-end-date').hide('slow')
    else
      $('.contract-end-date').show('slow')

# Show Consulting-Services-draft fields when generate it
showConsultingFields = ->
  if $('#contract_draft_id').find('option:selected').text() == consulting_draft
    $('.consulting-fields').show('slow')
  else
    $('.consulting-fields').hide('slow')
