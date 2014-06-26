# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


class QRAuth

  characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

  constructor:  ->
    @element    = $('#code')
#    @url = $('#redirect_url').val() || location.href
#    @url        = ko.observable location.href
    @challenge_url  = $('#full_url').val()
    @check_url    = $('#check_url').val()
    @redirect_url = $('#redirect_url').val()
    @qrcode     = ko.observable null
    @testingCount = 0
    @refreshTimer = ko.observable null
    @init()

  getNewChallenge    : ->
    $.ajax
      url: @check_url
      method: 'delete'
    .done ->
      location.reload()

  refresh : ->
    @element.qrcode @challenge_url

  regenerate : ->
    $ @element .empty()
    @getNewChallenge()

  checkForAuthenticated : ->
    $.ajax
      url: @check_url
    .done (data) =>
      if data.snapped? and data.snapped
        if @redirect_url
          location.href = @redirect_url
        else
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

$(document).on 'page:change', ->
  $('#qrcode').each ->
    view = new QRAuth
    ko.applyBindings view, this