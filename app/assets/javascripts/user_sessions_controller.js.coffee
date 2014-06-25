# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


class QRAuth

  characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

  _readChallengeFromPage = ->
    $('#full_url').val()
#    l = characters.length
#    r = new String
#    r = r + characters.charAt Math.floor Math.random() * l for [0..90]
#    r


  constructor:  ->
    @element    = $('#code')
    @url        = ko.observable location.href
    @challenge  = ko.observable _readChallengeFromPage()
    @qrcode     = ko.observable null
    @testingCount = 0
    @refreshTimer = ko.observable null
    @init()

  getNewChallenge    : ->
    $.ajax
      url: @challenge()
      method: 'delete'
    .done ->
      location.reload()

  refresh : ->
    @element.qrcode @challenge()

  regenerate : ->
    $ @element .empty()
    @getNewChallenge()

  checkForAuthenticated : ->
    $.ajax
      url: @challenge()
    .done (data) ->
      if data.email? and data.email.length > 0
        location.reload()

  toggleReload : ->
    if !@refreshTimer()
      @startReload()
    else
      clearInterval @refreshTimer()
      @refreshTimer false

  startReload : ->
    @refreshTimer setInterval(=>
      @checkForAuthenticated()
    , 1000)

  init    : =>
    @refresh()
    @startReload()

window.QRAuth = QRAuth

$ ->
  $('#qrcode').each ->
    view = new QRAuth
    ko.applyBindings view, this