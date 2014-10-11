querystring = require("querystring");

module.exports = {
	ajaxState: function(url) {
		$.ajax({
				url: url,
				dataType: 'json',
				success: function(data) {
					this.setState(data);
				}.bind(this),
				error: function(xhr, status, err) {
					this.setState(xhr.responseJSON);
				}.bind(this)
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
	}
};
