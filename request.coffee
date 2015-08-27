class @FBARequest
  constructor: (@service, @data, @filter) ->
    check @service, String
  getContent: ->
    content = {}
    content.SERVICE = @service
    content.DATA = @data if @data?
    content.FILTER = @filter if @filter?
    return content
  getJson: ->
    EJSON.stringify @getContent()
