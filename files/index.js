var { Runmain } = require('./require_app');
for(var exported in Runmain) {
  window[exported] = Runmain[exported];
}
