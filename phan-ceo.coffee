page = require('webpage').create()

page.open 'http://ceokarnataka.kar.nic.in/SearchWithEpicNo.aspx', () ->
    page.render 'ceo.png'
    phantom.exit()

