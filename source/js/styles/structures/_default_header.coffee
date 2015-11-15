$.style ?= {}
$.style.struct_default_header = ->
  $v = $('.main > .votes')
  if !$v.width()*$v.length < $(window).width()
    $('.action.button').attr("disabled", true)
    $('.actions').append('<div class="notice"></div>')
    $('.actions .notice').html('往右邊滑還有喔 →')

$.style.struct_default_header()
