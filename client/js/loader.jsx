/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
var loadingGif = require('images/loading.gif');

var Loader = React.createClass({
		render: function() {
			if (!this.props.loaded) {
				return (
					<div className="row">
						<div className="col-md-12">
							<img src={loadingGif} />
						</div>
					</div>);
			} else {
				return this.props.children;
			}
		}
});

module.exports = Loader;
