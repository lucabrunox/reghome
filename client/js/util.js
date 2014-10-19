querystring = require("querystring");

module.exports = {
	findIndex: function(arr, func) {
		for (var i=0; i < arr.length; i++) {
			if (func(arr[i])) {
				return i;
			}
		}
		
		return -1;
	},

	findElement: function(arr, func) {
		var i = this.findIndex(arr, func);
		if (i >= 0) {
			return arr[i];
		}
	},
	
	ajaxState: function(url, cb) {
		return $.ajax({
				type: "GET",
				url: url,
				dataType: 'json',
				success: function(data) {
					var data = data;
					if (cb) {
						cb(data);
					}
					this.setState(data);
				}.bind(this),
				error: function(xhr, status, err) {
					this.setState(xhr.responseJSON);
				}.bind(this)
		});
	},

	ajaxGet: function(url) {
		return $.ajax({
				type: "GET",
				url: url,
				dataType: 'json'
		});
	},

	ajaxPut: function(url) {
		return $.ajax({
				type: "PUT",
				url: url
		});
	},

	ajaxDelete: function(url) {
		return $.ajax({
				type: "DELETE",
				url: url
		});
	},
		
	ajaxPost: function(url, data) {
		return $.ajax({
				type: "POST",
				url: url,
				data: JSON.stringify(data),
				contentType: "application/json;charset=utf-8"
		});
	},
	
	getQuery: function(x) {
		var q = querystring.decode (location.search.substring(1));
		if (!x) {
			return q;
		} else {
			return q[x];
		}
	},
	
	toInt: function (x, d) {
		var i = parseInt(x);
		if (isNaN(i)) {
			return d || 0;
		}
		return i;
	},

	toFloat: function (x, d) {
		var i = parseFloat(x);
		if (isNaN(i)) {
			return d || 0.0;
		}
		return i;
	}
};
