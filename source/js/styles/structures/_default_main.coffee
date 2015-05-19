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

  $('.main').scroll (e) ->
    windowWidth = $(window).width()
    scrollLeft = e.target.scrollLeft
    scrollRight = e.target.scrollWidth - e.target.scrollLeft - windowWidth

    if scrollLeft < 0
      $('.main').addClass 'left-overscroll'
    else
      $('.main').removeClass 'left-overscroll'
    if scrollRight < 0
      $('.main').addClass 'right-overscroll'
    else
      $('.main').removeClass 'right-overscroll'

$.style.struct_default_main()
