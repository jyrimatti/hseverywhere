var { Runmain } = require('./require_app.macos');
for(var exported in Runmain) {
  window[exported] = Runmain[exported];
}

