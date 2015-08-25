@FBAPatterns = #([A-Z_]+)[\t ].+     $1: Match.Optional String
  customer:
    get: ->
      CUSTOMER_ID: Match.Optional String
      CUSTOMER_EXT_UID: Match.Optional String
      CUSTOMER_NUMBER: Match.Optional String
      COUNTRY_CODE: Match.Optional String
      CITY: Match.Optional String
      TERM: Match.Optional String
      COMMENT: Match.Optional String
      DASHBOARD_URL: Match.Optional String
      CHANGEDATA_URL: Match.Optional String
      HASH: Match.Optional String
    create: ->
      CUSTOMER_NUMBER: Match.Optional String
      CUSTOMER_EXT_UID: Match.Optional String
      CUSTOMER_TYPE: Match.OneOf 'business', 'consumer'
      ORGANIZATION: Match.Optional String
      POSITION: Match.Optional String
      SALUTATION: Match.Optional String
      TITLE_ACADEMIC: Match.Optional String
      FIRST_NAME: Match.Optional String
      LAST_NAME: Match.Optional String
      ADDRESS: Match.Optional String
      ADDRESS_2: Match.Optional String
      ZIPCODE: Match.Optional String
      CITY: Match.Optional String
      COUNTRY_CODE: Match.Optional String
      LANGUAGE_CODE: Match.Optional String
      PHONE: Match.Optional String
      PHONE_2: Match.Optional String
      FAX: Match.Optional String
      MOBILE: Match.Optional String
      EMAIL: Match.Optional String
      ACCOUNT_RECEIVABLE: Match.Optional String
      CURRENCY_CODE: Match.Optional String
      VAT_ID: Match.Optional String
      DAYS_FOR_PAYMENT: Match.Optional String
      PAYMENT_TYPE: Match.Optional Number
      SHOW_PAYMENT_NOTICE: Match.Optional String
      BANK_NAME: Match.Optional String
      BANK_CODE: Match.Optional String
      BANK_ACCOUNT_NUMBER: Match.Optional String
      BANK_ACCOUNT_OWNER: Match.Optional String
      BANK_ACCOUNT_OWNER_ADDRESS: Match.Optional String
      BANK_ACCOUNT_OWNER_CITY: Match.Optional String
      BANK_ACCOUNT_OWNER_ZIPCODE: Match.Optional String
      BANK_ACCOUNT_OWNER_EMAIL: Match.Optional String
      BANK_BIC: Match.Optional String
      BANK_IBAN: Match.Optional String
      PAYMILL_TOKEN: Match.Optional String
      COMMENT: Match.Optional String
      NEWSLETTER_OPTIN: Match.Optional String
      X_ATTRIBUTES: Match.Optional [{
        KEY: String
        VALUE: String
      }]
      PAYMILL_AMOUNT: Match.Optional String
      WIRECARD_GATEWAYREFERENCENUMBER: Match.Optional String
      ADYEN_ENCRYPTED_DATA: Match.Optional String
      PAYPAL_BILLINGAGREEMENTID: Match.Optional String
      AFFILIATE: Match.Optional String
      PAYMENT_PROVIDER: Match.Optional String
      PAYMENT_TOKEN: Match.Optional String
    update: ->
      _.extend FBAPatterns.customer.create(),
        CUSTOMER_ID: String
        CUSTOMER_TYPE: Match.Optional Match.OneOf 'business', 'consumer'
    delete: ->
      CUSTOMER_ID: String
    addcredits: ->
      CUSTOMER_ID: String
      AMOUNT: Number
    createsecurelink: ->
      CUSTOMER_ID: String
  subscription:
    get: ->
      SUBSCRIPTION_ID: Match.Optional String
      CUSTOMER_ID: Match.Optional String
      SUBSCRIPTION_EXT_UID: Match.Optional String
      CUSTOMER_EXT_UID: Match.Optional String
    create: ->
      SUBSCRIPTION_EXT_UID: Match.Optional String
      ARTICLE_NUMBER: Match.Optional String
      CUSTOMER_ID: Match.Optional String
      COUPON: Match.Optional String
      TITLE: Match.Optional String
      UNIT_PRICE: Match.Optional String
      CURRENCY_CODE: Match.Optional String
      DESCRIPTION: Match.Optional String
      INVOICE_TITLE: Match.Optional String
      START_DATE: Match.Optional String
      NEXT_EVENT: Match.Optional String
      X_ATTRIBUTES: Match.Optional [{
        KEY: String
        VALUE: String
      }]
      CANCELLATION_DATE: Match.Optional String
      ADDONS: Match.Optional [{
        ARTICLE_NUMBER: Match.Optional String
        QUANTITY: Match.Optional String
        TITLE: Match.Optional String
        DESCRIPTION: Match.Optional String
        UNIT_PRICE: Match.Optional String
        VAT_PERCENT: Match.Optional String
      }]
    update: ->
      SUBSCRIPTION_ID: String
      NEXT_EVENT: Match.Optional String
      SUBSCRIPTION_EXT_UID: Match.Optional String
      STATUS: Match.Optional String
      X_ATTRIBUTES: Match.Optional [{
        KEY: String
        VALUE: String
      }]
    changearticle: ->
      SUBSCRIPTION_ID: String
      QUANTITY: Match.Optional Number
      ARTICLE_NUMBER: String
      TITLE: Match.Optional String
      DESCRIPTION: Match.Optional String
      UNIT_PRICE: Match.Optional String
      CURRENCY_CODE: Match.Optional String
      RESET_ADDONS: Match.Optional Match.OneOf [0, 1]
      COUPON: Match.Optional String
      ADDONS: Match.Optional [{
        ARTICLE_NUMBER: Match.Optional String
        QUANTITY: Match.Optional String
        TITLE: Match.Optional String
        DESCRIPTION: Match.Optional String
        UNIT_PRICE: Match.Optional String
        VAT_PERCENT: Match.Optional String
      }]
    setaddon: ->
      SUBSCRIPTION_ID: String
      ARTICLE_NUMBER: String
      QUANTITY: Match.Optional Number
      TITLE: Match.Optional String
      UNIT_PRICE: Match.Optional String
      DESCRIPTION: Match.Optional String
    setusagedata: ->
      SUBSCRIPTION_ID: String
      ARTICLE_NUMBER: String
      QUANTITY: Match.Optional Number
      UNIT_PRICE: Match.Optional String
      DESCRIPTION: Match.Optional String
      USAGE_DATA: Match.Optional String
      CURRENCY_CODE: Match.Optional String
    getusagedata: ->
      SUBSCRIPTION_ID: String
      START: Match.Optional String
      END: Match.Optional String
    deleteusagedata: ->
      USAGEDATA_ID: String
    cancel: ->
      SUBSCRIPTION_ID: String
      CANCELLATION_DATE: Match.Optional String
      CANCELLATION_NOTE: Match.Optional String
    reactivate: ->
      SUBSCRIPTION_ID: String
    getupcomingamount: ->
      ARTICLE_NUMBER: Match.Optional String
      COUPON: Match.Optional String
      COUNTRY_CODE: Match.Optional String
      ADDONS: Match.Optional [{
        ARTICLE_NUMBER: Match.Optional String
        QUANTITY: Match.Optional String
        TITLE: Match.Optional String
        DESCRIPTION: Match.Optional String
        UNIT_PRICE: Match.Optional String
        VAT_PERCENT: Match.Optional String
      }]
    postpone: ->
      SUBSCRIPTION_ID: String
      MONTH: String
    renew: ->
      SUBSCRIPTION_ID: String
    createsecurelink: ->
      SUBSCRIPTION_ID: String
  invoice:
    get: ->
      INVOICE_ID: Match.Optional String
      INVOICE_NUMBER: Match.Optional String
      INVOICE_TITLE: Match.Optional String
      CUSTOMER_ID: Match.Optional String
      MONTH: Match.Optional String
      YEAR: Match.Optional String
      START_DUE_DATE: Match.Optional String
      END_DUE_DATE: Match.Optional String
      TYPE: Match.Optional Match.OneOf ['outgoing', 'draft', 'credit']
    create: ->
      CUSTOMER_ID: String
      CUSTOMER_COSTCENTER_ID: Match.Optional String
      CURRENCY_CODE: Match.Optional String
      TEMPLATE_ID: Match.Optional String
      INTROTEXT: Match.Optional String
      INVOICE_TITLE: Match.Optional String
      INVOICE_DATE: Match.Optional String
      DELIVERY_DATE: Match.Optional String
      CASH_DISCOUNT_PERCENT: Match.Optional String
      CASH_DISCOUNT_DAYS: Match.Optional String
      EU_DELIVERY: Match.Optional String
      ITEMS: Match.Optional [{
        INVOICE_ITEM_ID: Match.Optional String
        ARTICLE_NUMBER: Match.Optional String
        DESCRIPTION: Match.Optional String
        QUANTITY: Match.Optional String
        UNIT_PRICE: Match.Optional String
        VAT_PERCENT: Match.Optional String
        VAT_VALUE: Match.Optional String
        COMPLETE_NET: Match.Optional String
        COMPLETE_GROSS: Match.Optional String
        SORT_ORDER: Match.Optional String
      }]
    update: ->
      _.extend FBAPatterns.invoice.create,
        INVOICE_ID: String
        DELETE_EXISTING_ITEMS: Match.Optional String
    delete: ->
      INVOICE_ID: String
    complete: ->
      INVOICE_ID: String
    cancel: ->
      INVOICE_ID: String
    sign: ->
      INVOICE_ID: String
    sendbyemail: ->
      INVOICE_ID: String
      RECIPIENT: String
      SUBJECT: String
      MESSAGE: String
      RECEIPT_CONFIRMATION: Match.Optional String
    sendbypost: ->
      INVOICE_ID: String
    setpaid: ->
      INVOICE_ID: String
      PAID_DATE: Match.Optional String
    getreminders: ->
      INVOICE_ID: String
  item:
    get: ->
      INVOICE_ID: String
    delete: ->
      INVOICE_ITEM_ID: String
  article:
    get: ->
      ARTICLE_NUMBER: Match.Optional String
      TAGS: Match.Optional String
  shipment:
    get: ->
      SHIPMENT_ID: Match.Optional String
      SUBSCRIPTION_ID: Match.Optional String
    update: ->
      SHIPMENT_ID: String
      SUBSCRIPTION_ID: Match.Optional String
      DATE: Match.Optional String
      TRACKING_NUMBER: Match.Optional String
      SHIPPER: Match.Optional String
      ARTICLE_OPTION: Match.Optional String
    delete: ->
      SHIPMENT_ID: String
  coupon:
    get: ->
      CODE: String
    check: ->
      CODE: String
  template:
    get: ->
      Match.OneOf null, undefined
