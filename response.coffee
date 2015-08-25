class @FBAResponse
  constructor: (response) ->
    if response.data?
      @_content = response.data
    else
      @_content = EJSON.parse response.content
    @request = @_content.REQUEST
    @data = @_content.RESPONSE

  hasErrors: ->
    return @data.ERRORS?.length > 0
  getErrors: ->
    return @data.ERRORS
