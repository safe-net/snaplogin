# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).on 'page:change', ->
  $('#gmap_canvas').each ->

    myOptions =
      zoom      :16
      center    :new google.maps.LatLng 39.4667169, -76.23899640000002
      mapTypeId : google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions)
    marker = new google.maps.Marker(map: map, position: new google.maps.LatLng(39.4667169, -76.23899640000002))
    infowindow = new google.maps.InfoWindow content:"<b>snaplogin from:</b><br/>4690 Millenium Drive<br/> Belcamp, MD"
    google.maps.event.addListener(marker, "click", -> infowindow.open(map,marker))
    infowindow.open(map,marker)
  #  google.maps.event.addDomListener(window, 'load', init_map)
