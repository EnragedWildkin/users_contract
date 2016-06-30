class @ContractNew
  constructor: ->
    initFunc()

initFunc = ->
  initVariables()
  hideEndDate()
  showConsultingFields()
  $('#contract_draft_id').change ->
    hideEndDate()
    showConsultingFields()

initVariables = ->
  @.consulting_draft = 'Consulting-Services-draft'
  @.contracts_without_end_date_field = [
    'NDA-LLC-draft-Ukraine',
    'NDA-LLC-draft-Russia'
  ]
  @.today = new Date().toISOString().substring(0, 10)

# Don't show end_date field on NDA drafts
hideEndDate = ->
  if $.inArray($('#contract_draft_id').find('option:selected').text(),
    contracts_without_end_date_field) >= 0
    $('.contract-end-date').hide('slow')
    $('#contract_end_date').val('')
  else
    $('.contract-end-date').show('slow')
    $('#contract_end_date').val(today)

# Show Consulting-Services-draft fields when generate it
showConsultingFields = ->
  if $('#contract_draft_id').find('option:selected').text() == consulting_draft
    $('.consulting-fields').show('slow')
  else
    $('.consulting-fields').hide('slow')
