requirejs.config({
    baseUrl: 'js',
});

_require = require;
require = function(s) {
	return _require([s]);
};
require('react');