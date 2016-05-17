'use strict';
var { Runmain } = require('./require_app_desktop');
for(var exported in Runmain) {
  window[exported] = Runmain[exported];
}

