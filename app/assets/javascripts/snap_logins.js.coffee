# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).on 'page:change', ->
#  identifier = 'SAMLRequest='
#  if location.search.indexOf(identifier) >= 0
#    b64ZlibxmlStrDoc = location.search.slice(identifier.length + 1)
#    ZlibxmlStrDoc = btoa b64ZlibxmlStrDoc
#    CompressedxmlStrDoc = new Zlib.inflate ZlibxmlStrDoc
#    xmlStrDoc = CompressedxmlStrDoc.decompress()
#    console.log xmlStrDoc
