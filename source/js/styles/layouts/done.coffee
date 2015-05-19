$.style ?= {}
$.style.layo_done = ->
  setTimeout ->
    $('body').addClass('ready')
  , 300

$(window).load ->
  $.style.layo_done()
