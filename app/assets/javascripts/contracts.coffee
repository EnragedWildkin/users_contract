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

# Don't show end_date field on NDA drafts
hideEndDate = ->
  if $.inArray($('#contract_draft_id').find('option:selected').text(),
    contracts_without_end_date_field) >= 0
    $('.contract-end-date').hide('slow')
  else
    $('.contract-end-date').show('slow')

# Show Consulting-Services-draft fields when generate it
showConsultingFields = ->
  if $('#contract_draft_id').find('option:selected').text() == consulting_draft
    $('.consulting-fields').show('slow')
  else
    $('.consulting-fields').hide('slow')
