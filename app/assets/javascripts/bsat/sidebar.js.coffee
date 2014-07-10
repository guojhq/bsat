window.bsat.utils.readyOrPageChange ->
  #
  # Setup sidebar open/close state when the user
  # clicks on sidebar toggle button. The sidebar
  # gets closed on small devices using media queries,
  # so we need to take this into account.
  #
  $('#left-sidebar-toggle-button').click (e) ->
    e.preventDefault()
    if $(window).width() <= 768
      $('body').toggleClass('left-sidebar-open')
      $('body').removeClass('left-sidebar-close')
    else
      $('body').removeClass('left-sidebar-open')
      $('body').toggleClass('left-sidebar-close')


  $('#right-sidebar-toggle-button').click (e) ->
    e.preventDefault()
    if $(window).width() <= 768
      $('body').toggleClass('right-sidebar-open')
      $('body').removeClass('right-sidebar-close')
    else
      $('body').removeClass('right-sidebar-open')
      $('body').toggleClass('right-sidebar-close')

  #
  # Detect if there is no sidebar
  #
  unless $('#sidebar')[0]
    $('body').addClass('no-sidebar')

  #
  # Use IScroll for scrolling the sidebar
  #
  selector = '#sidebar'
  new IScroll(selector, {
    scrollbars: true,
    fadeScrollbars: true,
    mouseWheel: true,
    click: true
  }) if $(selector)[0]
