$.style ?= {}
$.style.layo_default = ->
  setTimeout ->
    $('body').addClass('ready')
  , 300

$(window).load ->
  $.style.layo_default()
