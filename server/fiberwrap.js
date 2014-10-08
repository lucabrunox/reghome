var Future = require('fibers/future');

fiberWrap = function(obj, methods) {
	var wrapCache = {};
	var ret = { orig: obj };
	
	for (var i=0; i < methods.length; i++) {
		var method = methods[i];
		
		if (typeof method == "string") {
			var wrapper = Future.wrap(obj[method].bind(obj));
			ret[method] = function() { return wrapper.apply(null, arguments).wait(); };
		} else {
			var wrapper = Future.wrap(obj[method[0]].bind(obj), "array");
			ret[method[0]] = function (names) {
				return function() {
					var arr = wrapper.apply(null, arguments).wait();
					var res = {};
					for (var j=1; j < names.length; j++) {
						if (typeof names[j] == "string") {
							res[names[j]] = arr[j-1];
						} else {
							res[names[j][0]] = fiberWrap (arr[j-1], names[j][1]);
						}
					}
					return res;
				}
			}(method);
		}
	}
	
	return ret;
};

module.exports = fiberWrap;