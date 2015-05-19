##
# Form Processing Logic
##

window.skip = false

# selecting in single-selection-form

$('.single-selection-form .candidate.selection').each ->
  $(this).click ->
    if $(this).hasClass 'selected'
      $('.candidate.selection').removeClass 'selected'
      $('#selection').val ''
    else
      $('#selection').val $(this).children('.id').html()
      $('.candidate.selection').removeClass 'selected'
      $(this).addClass 'selected'

# selecting in multiple-selection-form

$('.multiple-selection-form .candidate.selection').each ->
  $(this).click ->
    if $(this).hasClass 'selected'
      $(this).removeClass 'selected'
      $('#selection').val ''
    else
      $(this).addClass 'selected'
    selectedIds = []
    for selectedItems in $('.candidate.selection.selected')
      selectedIds.push $(selectedItems).children('.id').html()
    $('#selection').val selectedIds.join(',')

# submitting token-form

$('.token-form').submit ->
  if $('#password1').val().match('[A-Z][0-9][A-Z]{2}') && $('#password2').val().match('[A-Z]{3}') && $('#password3').val().match('[A-Z]{3}')
    return true
  else
    $('.input').addClass 'error animated shake'
    setTimeout ->
      $('.input').removeClass 'shake'
    , 1000
    $('#password3').focus()
    return false

# submitting token-form

$('.single-selection-form').submit (e) ->
  console.log e
  if $('.candidate.selection.selected')[0]
    if window.skip || confirm('您決定投給 ' + $('#selection').val() + ' 號 ' + $('.candidate.selection.selected').children('.name').html() + '，確定嗎？\n You’ve decided to vote for No. ' + $('#selection').val() + ' - ' + $('.candidate.selection.selected').children('.name').html() + ', is that right?')
      $('input[type="submit"]').prop 'disabled', true
      $('body').addClass('sending')
      return true
    else
      return false
  else
    if window.skip || confirm('您決定投空白廢票，確定嗎？\n You’ve decided to cast a blank ballot, is that right?')
      $('input[type="submit"]').prop 'disabled', true
      $('body').addClass('sending')
      return true
    else
      return false

# submitting multiple-selection-form

$('.multiple-selection-form').submit (e) ->
  console.log e
  if window.skip || confirm('確定送出？\n Are you sure you want to submit?')
    $('input[type="submit"]').prop 'disabled', true
    $('body').addClass('sending')
    return true
  else
    return false

# submitting agree-or-disagree-form

$('.agree-or-disagree-form').submit (e) ->
  if window.skip || confirm('確定送出？\n Are you sure you want to submit?')
    $('input[type="submit"]').prop 'disabled', true
    $('body').addClass('sending')
    return true
  else
    return false

# submitting skips

$('button.skip').click (e) ->
  if confirm('確定略過此投票？\n Are you sure you want to skip?')
    $('input.skipped').val(true)
    $('.candidate.selection').removeClass 'selected'
    $('#selection').val ''
    $('input.none').prop('checked', true)
    window.skip = true
    $('body').addClass('skipping')
    return true
  else
    return false

##
# Inbox (Uncategorized Logic)
##

setTimeout ->
  $('.input').removeClass 'shake'
, 1000

if $('#password3').val()?.length > 0 || $('#password2').val()?.length > 0 || $('#password1').val()?.length > 0
  $('#password1').val ''
  $('#password2').val ''
  $('#password3').val ''

$('#password1').keyup ->
  $(this).val $(this).val().toUpperCase()
  if $(this).val().length >= $(this).attr('maxlength')
    $('#password2').focus()
    setTimeout ->
      $('#password2').focus()
    , 1000

$('#password2').keyup ->
  $(this).val $(this).val().toUpperCase()
  if $(this).val().length >= $(this).attr('maxlength')
    $('#password3').focus()

$('#password3').keyup ->
  $(this).val $(this).val().toUpperCase()

$('#password1').keydown ->
  $('.input').removeClass 'error'

$('#password2').keydown (e) ->
  $('.input').removeClass 'error'
  if $(this).val().length == 0 && (e.keyCode == 8 || e.keyCode == 37)
    $('#password1').focus()

$('#password3').keydown (e) ->
  $('.input').removeClass 'error'
  if $(this).val().length == 0 && (e.keyCode == 8 || e.keyCode == 37)
    $('#password2').focus()
