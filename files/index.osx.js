'use strict';
var { Runmain } = require('./require_app.osx');
for(var exported in Runmain) {
  window[exported] = Runmain[exported];
}

