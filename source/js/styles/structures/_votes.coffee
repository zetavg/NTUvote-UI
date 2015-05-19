$.style ?= {}
$.style.struct_votes = ->
  $votesManySelection = $('.votes.many .selection')
  if $votesManySelection
    selectionCount = parseInt($votesManySelection.length / 3 + 0.5)
    $(".votes.many .selection:nth-child(1)").before('<div class="lb"></div>')
    $(".votes.many .selection:nth-child(#{selectionCount + 1})")
      .after('<div class="lb"></div>')
    $(".votes.many .selection:nth-child(#{selectionCount*2 + 2})")
      .after('<div class="lb"></div>')

$.style.struct_votes()
