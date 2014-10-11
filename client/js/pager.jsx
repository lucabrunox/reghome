/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
var Link = require('./router.jsx').Link;
var Util = require('./util.js');

var Pager = React.createClass ({
	
	render: function() {
		var page = Util.toInt(this.props.page, 1);
		var query = function(i) {
			return { page: {$set: i} };
		}
		
		var prev;
		if (this.props.page > 1) {
			prev = <li><Link query={query(page-1)}>Prev</Link></li>;
		} else {
			prev = <li className="disabled"><a>Prev</a></li>;
		}
		
		var prevs = [];
		for (var i=1; i < page; i++) {
			prevs.push (<li><Link key={i} query={query(i)}>{i}</Link></li>);
		}

		var cur = <li className="active"><Link query={query(page)}>{page}</Link></li>;
		
		var next = <li><Link query={query(page+1)}>Next</Link></li>;
		
		return (
			<ul className="pagination">
			  {prev}
				{prevs}
				{cur}
				{next}
			</ul>
		);
	},
	
});

module.exports = Pager;
