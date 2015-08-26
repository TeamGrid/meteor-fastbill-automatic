# team:fastbill-automatic
Meteor implementation of the FastBill-Automatic API

## Installation

```
    meteor add team:fastbill-automatic
```

## Usage

Initialize a new API-Connection
````javascript
var api = new FastBillAutomatic('ApiEmail', 'ApiKey');
````

Make an api call (see [API Documentation](http://www.fastbill-automatic.com/api/automatic/en/fundamentals.html) for other methods and parameters)
````javascript
var articles = api['customer.create'](customerObj); // parameters are always passed as a single object
````


Register for notifications
````javascript
api.registerNotifications('/fastbillnotifications'); // registers this url to process webhooks. Set this url to the notifications-url in fastbill
````

Listen on notifications of type `payment.failed`. See the [Notifications-Documentation](http://www.fastbill-automatic.com/content/dokumentation/FBA_Notifications_EN.pdf) to get a list of all notifications.
````javascript
FastBillAutomaticAPI.on('payment.failed', function(data){
  console.log(data);
});
````
