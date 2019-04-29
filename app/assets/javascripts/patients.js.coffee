
$ ->
  getFacilityPatients()

  $('#facilities li a').click (e) ->
    e.preventDefault()
    selected = $(this).text() + ' <span class="caret"></span>'
    $(this).parents('.btn-group').find('.btn').html(selected)
    getFacilityPatients($(this)[0].id)
    return
  return

getFacilityPatients = (facility_id) ->
  url = '/patients/list'
  if facility_id
    url = url + '/?facility_id=' + facility_id
  $.ajax
    method: 'get'
    url: url
    success: (result) ->
  return
