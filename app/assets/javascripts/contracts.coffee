$ ->
# Set contract_pdf field to true if press button "Generate PDF"
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

# Edit user chosen in the select tag(#contract_user_id)
class window.AdminEditUser
  constructor: ->
    url =  '/users/' + $('#contract_user_id').val() + '/edit'
    $('.edit').attr('href', url)
    $('#contract_user_id').change ->
      url = '/users/' + $(this).val() + '/edit'
      if url
        $('.edit').attr 'href', url
      false
