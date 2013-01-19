casper = require('casper').create()

names = []

getInfo = ->
    names = document.querySelectorAll "table#ctl00_ContentPlaceHolder1_GridView1 tbody tr td"
    Array::map.call names, (e) ->
        id = e.getAttribute "id"
        val = e.innerHTML
        "#{val}:#{id}"

casper.start 'http://ceokarnataka.kar.nic.in/SearchWithEpicNo.aspx', ->
   @fill '#aspnetForm', "ctl00$ContentPlaceHolder1$ddlDistrict": '5', true

casper.then ->
    @echo "#{document}"
    names = @evaluate getInfo

casper.run ->
    @echo(names.join("\n")).exit()
