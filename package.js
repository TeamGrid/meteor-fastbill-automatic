Package.describe({
  name: 'team:fastbill-automatic',
  summary: 'Meteor implementation of the FastBill-Automatic API',
  version: '0.2.1',
  git: 'https://github.com/TeamGrid/meteor-fastbill-automatic'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.2.1');
  api.use([
    'coffeescript',
    'underscore',
    'http',
    'cfs:http-methods@0.0.29',
  ]);
  api.addFiles([
    'patterns.coffee',
    'request.coffee',
    'response.coffee',
    'fastbillautomatic.coffee',
  ],'server');
  api.export('FastBillAutomatic');
});
