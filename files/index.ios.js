'use strict';
var { Runmain } = require('./require_app_others');
for(var exported in Runmain) {
  window[exported] = Runmain[exported];
}

