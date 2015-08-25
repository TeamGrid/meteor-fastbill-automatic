class FastBillAutomatic
  @_ApiUrl = 'https://automatic.fastbill.com/api/1.0/api.php'
  _apiCall: (service, data) ->
    request = new FBARequest service, data
    response = @_HTTP.post FastBillAutomatic._ApiUrl,
      data: request.getContent()
      auth: "#{@ApiMail}:#{@ApiKey}"
      headers:
        'Content-Type': 'application/json; charset=utf-8'
    return new FBAResponse response
  _makeRequest: (service, responseKey, data, dataFormat) ->
    check data, dataFormat
    response = @_apiCall service, data
    throw new Error response.getErrors() if response.hasErrors()
    return response.data[responseKey] if responseKey?
    return response.data


  # public methods
  constructor: (@ApiMail, @ApiKey, @_HTTP = HTTP) ->

  'customer.get': (data = {}) ->
    @_makeRequest 'customer.get', 'CUSTOMERS', data, FBAPatterns.customer.get()
  'customer.create': (data) ->
    @_makeRequest 'customer.create', null, data, FBAPatterns.customer.create()
  'customer.update': (data) ->
    @_makeRequest 'customer.update', null, data, FBAPatterns.customer.update()
  'customer.delete': (data) ->
    @_makeRequest 'customer.delete', 'STATUS', data, FBAPatterns.customer.delete()
  'customer.addcredits': (data) ->
    @_makeRequest 'customer.addcredits', 'STATUS', data, FBAPatterns.customer.addcredits()
  'customer.createsecurelink': (data) ->
    @_makeRequest 'customer.createsecurelink', null, data, FBAPatterns.customer.createsecurelink()

  'subscription.get': (data = {}) ->
    @_makeRequest 'subscription.get', null, data, FBAPatterns.subscription.get()
  'subscription.create': (data) ->
    @_makeRequest 'subscription.create', null, data, FBAPatterns.subscription.create()
  'subscription.update': (data) ->
    @_makeRequest 'subscription.update', 'STATUS', data, FBAPatterns.subscription.update()
  'subscription.changearticle': (data) ->
    @_makeRequest 'subscription.changearticle', null, data, FBAPatterns.subscription.changearticle()
  'subscription.setaddon': (data) ->
    @_makeRequest 'subscription.setaddon', 'STATUS', data, FBAPatterns.subscription.setaddon()
  'subscription.setusagedata': (data) ->
    @_makeRequest 'subscription.setusagedata', null, data, FBAPatterns.subscription.setusagedata()
  'subscription.getusagedata': (data) ->
    @_makeRequest 'subscription.getusagedata', null, data, FBAPatterns.subscription.getusagedata()
  'subscription.deleteusagedata': (data) ->
    @_makeRequest 'subscription.deleteusagedata', 'STATUS', data, FBAPatterns.subscription.deleteusagedata()
  'subscription.reactivate': (data) ->
    @_makeRequest 'subscription.reactivate', 'STATUS', data, FBAPatterns.subscription.reactivate()
  'subscription.cancel': (data) ->
    @_makeRequest 'subscription.cancel', null, data, FBAPatterns.subscription.cancel()
  'subscription.getupcomingamount': (data) ->
    @_makeRequest 'subscription.getupcomingamount', 'TOTAL', data, FBAPatterns.subscription.getupcomingamount()
  'subscription.postpone': (data) ->
    @_makeRequest 'subscription.postpone', 'STATUS', data, FBAPatterns.subscription.postpone()
  'subscription.renew': (data) ->
    @_makeRequest 'subscription.renew', 'STATUS', data, FBAPatterns.subscription.renew()
  'subscription.createsecurelink': (data) ->
    @_makeRequest 'subscription.createsecurelink', null, data, FBAPatterns.subscription.createsecurelink()

  'invoice.get': (data = {}) ->
    @_makeRequest 'invoice.get', null, data, FBAPatterns.invoice.get()
  'invoice.create': (data) ->
    @_makeRequest 'invoice.create', null, data, FBAPatterns.invoice.create()
  'invoice.update': (data) ->
    @_makeRequest 'invoice.update', 'STATUS', data, FBAPatterns.invoice.update()
  'invoice.delete': (data) ->
    @_makeRequest 'invoice.delete', 'STATUS', data, FBAPatterns.invoice.delete()
  'invoice.complete': (data) ->
    @_makeRequest 'invoice.complete', null, data, FBAPatterns.invoice.complete()
  'invoice.cancel': (data) ->
    @_makeRequest 'invoice.cancel', null, data, FBAPatterns.invoice.cancel()
  'invoice.sign': (data) ->
    @_makeRequest 'invoice.sign', null, data, FBAPatterns.invoice.sign()
  'invoice.sendbypost': (data) ->
    @_makeRequest 'invoice.sendbypost', null, data, FBAPatterns.invoice.sendbypost()
  'invoice.setpaid': (data) ->
    @_makeRequest 'invoice.setpaid', null, data, FBAPatterns.invoice.setpaid()
  'invoice.getreminders': (data) ->
    @_makeRequest 'invoice.getreminders', null, data, FBAPatterns.invoice.getreminders()

  'item.get': (data) ->
    @_makeRequest 'item.get', null, data, FBAPatterns.item.get()
  'item.delete': (data) ->
    @_makeRequest 'item.delete', 'STATUS', data, FBAPatterns.item.delete()

  'article.get': (data = {}) ->
    @_makeRequest 'article.get', 'ARTICLES', data, FBAPatterns.article.get()

  'shipment.get': (data = {}) ->
    @_makeRequest 'shipment.get', null, data, FBAPatterns.shipment.get()
  'shipment.update': (data) ->
    @_makeRequest 'shipment.update', null, data, FBAPatterns.shipment.update()
  'shipment.delete': (data) ->
    @_makeRequest 'shipment.delete', null, data, FBAPatterns.shipment.delete()

  'coupon.get': (data) ->
    @_makeRequest 'coupon.get', null, data, FBAPatterns.coupon.get()
  'coupon.check': (data) ->
    @_makeRequest 'coupon.check', null, data, FBAPatterns.coupon.check()

  'template.get': ->
    @_makeRequest 'template.get', null, null, FBAPatterns.template.get()
