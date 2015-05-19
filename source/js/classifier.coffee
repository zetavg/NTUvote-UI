html = document.getElementsByTagName('html')[0]

if window.chrome
  html.className += ' chrome'
if Modernizr.touch
  html.className += ' touch'
else
  html.className += ' non-touch'
if navigator.platform.toUpperCase().indexOf('MAC')>=0
  html.className += ' mac'
if navigator.platform.match(/(iPhone|iPod|iPad)/i)
  html.className += ' ios'
if navigator.appVersion.match(/(Win)/i)
  html.className += ' windows'
