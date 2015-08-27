class FastBillAutomatic
  @_ApiUrl = 'https://automatic.fastbill.com/api/1.0/api.php'
  @_notifications = [
    'customer.created',
    'customer.changed',
    'customer.deleted',
    'subscription.created',
    'subscription.changed',
    'subscription.canceled',
    'subscription.closed',
    'payment.created',
    'payment.failed',
    'payment.chargeback',
    'payment.refunded',
  ]
  _apiCall: (service, data, filter) ->
    request = new FBARequest service, data, filter
    response = @_HTTP.post FastBillAutomatic._ApiUrl,
      data: request.getContent()
      auth: "#{@ApiMail}:#{@ApiKey}"
      headers:
        'Content-Type': 'application/json; charset=utf-8'
    return new FBAResponse response
  _makeRequest: (service, responseKey, data, filter, dataFormat) ->
    if data?
      check data, dataFormat
    else
      check filter, dataFormat
    response = @_apiCall service, data, filter
    throw new Error response.getErrors() if response.hasErrors()
    return response.data[responseKey] if responseKey?
    return response.data


  # public methods
  _events: {}
  constructor: (@ApiMail, @ApiKey, @_HTTP = HTTP) ->
  registerNotifications: (url) ->
    check url, String
    method = {}
    method[url] = post: (data) =>
      throw new Error "Unknown notification type '#{notification}'!" unless data.type in FastBillAutomatic._notifications
      @_trigger data.type, _.omit data, 'type'
    HTTP.methods method
  _trigger: (notification, data) ->
    throw new Error "Unknown notification type '#{notification}'!" unless notification in FastBillAutomatic._notifications
    callback data for callback in @_events[notification]
  on: (notification, callback) ->
    throw new Error "Unknown notification type '#{notification}'!" unless notification in FastBillAutomatic._notifications
    @_events[notification] = [] unless @_events[notification]?
    @_events[notification].push callback


  'customer.get': (filter = {}) ->
    @_makeRequest 'customer.get', 'CUSTOMERS', null, filter, FBAPatterns.customer.get()
  'customer.create': (data) ->
    @_makeRequest 'customer.create', null, data, null, FBAPatterns.customer.create()
  'customer.update': (data) ->
    @_makeRequest 'customer.update', null, data, null, FBAPatterns.customer.update()
  'customer.delete': (data) ->
    @_makeRequest 'customer.delete', 'STATUS', data, null, FBAPatterns.customer.delete()
  'customer.addcredits': (data) ->
    @_makeRequest 'customer.addcredits', 'STATUS', data, null, FBAPatterns.customer.addcredits()
  'customer.createsecurelink': (data) ->
    @_makeRequest 'customer.createsecurelink', null, data, null, FBAPatterns.customer.createsecurelink()

  'subscription.get': (filter = {}) ->
    @_makeRequest 'subscription.get', 'SUBSCRIPTIONS', null, filter, FBAPatterns.subscription.get()
  'subscription.create': (data) ->
    @_makeRequest 'subscription.create', null, data, null, FBAPatterns.subscription.create()
  'subscription.update': (data) ->
    @_makeRequest 'subscription.update', 'STATUS', data, null, FBAPatterns.subscription.update()
  'subscription.changearticle': (data) ->
    @_makeRequest 'subscription.changearticle', null, data, null, FBAPatterns.subscription.changearticle()
  'subscription.setaddon': (data) ->
    @_makeRequest 'subscription.setaddon', 'STATUS', data, null, FBAPatterns.subscription.setaddon()
  'subscription.setusagedata': (data) ->
    @_makeRequest 'subscription.setusagedata', null, data, null, FBAPatterns.subscription.setusagedata()
  'subscription.getusagedata': (data) ->
    @_makeRequest 'subscription.getusagedata', null, data, null, FBAPatterns.subscription.getusagedata()
  'subscription.deleteusagedata': (data) ->
    @_makeRequest 'subscription.deleteusagedata', 'STATUS', data, null, FBAPatterns.subscription.deleteusagedata()
  'subscription.reactivate': (data) ->
    @_makeRequest 'subscription.reactivate', 'STATUS', data, null, FBAPatterns.subscription.reactivate()
  'subscription.cancel': (data) ->
    @_makeRequest 'subscription.cancel', null, data, null, FBAPatterns.subscription.cancel()
  'subscription.getupcomingamount': (data) ->
    @_makeRequest 'subscription.getupcomingamount', 'TOTAL', data, null, FBAPatterns.subscription.getupcomingamount()
  'subscription.postpone': (data) ->
    @_makeRequest 'subscription.postpone', 'STATUS', data, null, FBAPatterns.subscription.postpone()
  'subscription.renew': (data) ->
    @_makeRequest 'subscription.renew', 'STATUS', data, null, FBAPatterns.subscription.renew()
  'subscription.createsecurelink': (data) ->
    @_makeRequest 'subscription.createsecurelink', null, data, null, FBAPatterns.subscription.createsecurelink()

  'invoice.get': (filter = {}) ->
    @_makeRequest 'invoice.get', 'INVOICES', null, filter, FBAPatterns.invoice.get()
  'invoice.create': (data) ->
    @_makeRequest 'invoice.create', null, data, null, FBAPatterns.invoice.create()
  'invoice.update': (data) ->
    @_makeRequest 'invoice.update', 'STATUS', data, null, FBAPatterns.invoice.update()
  'invoice.delete': (data) ->
    @_makeRequest 'invoice.delete', 'STATUS', data, null, FBAPatterns.invoice.delete()
  'invoice.complete': (data) ->
    @_makeRequest 'invoice.complete', null, data, null, FBAPatterns.invoice.complete()
  'invoice.cancel': (data) ->
    @_makeRequest 'invoice.cancel', null, data, null, FBAPatterns.invoice.cancel()
  'invoice.sign': (data) ->
    @_makeRequest 'invoice.sign', null, data, null, FBAPatterns.invoice.sign()
  'invoice.sendbypost': (data) ->
    @_makeRequest 'invoice.sendbypost', null, data, null, FBAPatterns.invoice.sendbypost()
  'invoice.setpaid': (data) ->
    @_makeRequest 'invoice.setpaid', null, data, null, FBAPatterns.invoice.setpaid()
  'invoice.getreminders': (data) ->
    @_makeRequest 'invoice.getreminders', null, data, null, FBAPatterns.invoice.getreminders()

  'item.get': (data) ->
    @_makeRequest 'item.get', null, data, null, FBAPatterns.item.get()
  'item.delete': (data) ->
    @_makeRequest 'item.delete', 'STATUS', data, null, FBAPatterns.item.delete()

  'article.get': (data = {}) ->
    @_makeRequest 'article.get', 'ARTICLES', data, null, FBAPatterns.article.get()

  'shipment.get': (data = {}) ->
    @_makeRequest 'shipment.get', null, data, null, FBAPatterns.shipment.get()
  'shipment.update': (data) ->
    @_makeRequest 'shipment.update', null, data, null, FBAPatterns.shipment.update()
  'shipment.delete': (data) ->
    @_makeRequest 'shipment.delete', null, data, null, FBAPatterns.shipment.delete()

  'coupon.get': (filter = {}) ->
    @_makeRequest 'coupon.get', null, null, filter, FBAPatterns.coupon.get()
  'coupon.check': (data) ->
    @_makeRequest 'coupon.check', null, data, null, FBAPatterns.coupon.check()

  'template.get': ->
    @_makeRequest 'template.get', null, null, FBAPatterns.template.get()
