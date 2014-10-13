/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');

var Calculator = React.createClass({
	getInitialState: function() {
		return { input: "", result: null, error: false };
	},

	handleChange: function() {
		try {
			var val = $(this.refs.input.getDOMNode()).val();
			this.setState ({ input: val, result: eval(val) });
		} catch (e) {
			this.setState ({ result: null });
		}
	},
	
	render: function () {
		return (
			<form className={this.props.className+" form-inline"}>
			  <div className="form-group">
				  <input ref="input" onChange={this.handleChange} className="form-control" type="text" placeholder="Calculator" />
					&nbsp;<div className="well well-sm calc-result">&nbsp;{this.state.result}</div>
				</div>
			</form>
		)
	}
});

module.exports = Calculator;