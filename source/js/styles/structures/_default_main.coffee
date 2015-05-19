$.style ?= {}
$.style.struct_default_main = ->
  $main = $('#main')
  $v = $('.main > .votes')

  if $v.width()*$v.length < $(window).width()
    $('.main').addClass('mini')
  else
    $('.main').prepend \
      '<span class="main-before"><div class="after">a</div></span>'
    $('.main').append \
      '<span class="main-after"><div class="after">a</div></span>'

  checkScrollingR = () ->
    if (($main.scrollLeft() + $main.width()) >= $v.width())
      $('.action.button').attr("disabled", false)
      $('.actions .notice').html('')
    else
      setTimeout ->
        checkScrollingR()
      , 100

  if !$v.width()*$v.length < $(window).width()
    checkScrollingR()

  if !Modernizr.cssvhunit or !Modernizr.csscalc
    $('.main').css 'height', ($(window).height()) + 'px'
    $('.main').css 'padding-top', ($(window).height()*0.2) + 'px'
    $('.main').css 'margin-top', (-$(window).height()*0.2) + 'px'
    $('.candidate .pic').css 'height', \
      ($(window).height()*0.8 - $('.candidate .id').height() \
                              - $('.candidate .elect').height() \
                              - $('.candidate .choices').height() \
                              - $('.candidate .name').height() - 60) + 'px'

  $('.main .main-after .after').css 'bottom', (-$(window).height()*0.10) + 'px'
  $('.main .main-before .after').css 'bottom', (-$(window).height()*0.10) + 'px'

$.style.struct_default_main()
