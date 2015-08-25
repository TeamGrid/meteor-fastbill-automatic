class @FBARequest
  constructor: (@service, @data) ->
  getContent: ->
    SERVICE: @service
    DATA: @data
  getJson: ->
    EJSON.stringify @getContent()
