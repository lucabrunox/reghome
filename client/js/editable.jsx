/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
React.addons = require('react/addons').addons;
var Typeahead = require('react-typeahead').Typeahead;

var Combo = React.createClass({
	getInitialState: function () {
		return { editing: false };
	},

	componentDidUpdate: function() {
		if (this.state.editing) {
			var self = this;
			$(this.refs.combo.getDOMNode()).find("input").focus().keydown(function(e) {
					if (e.keyCode == 27) {
						self.setState ({ editing: false });
					}
			}).blur(function() {
					// ugly hack
					setTimeout(function() {
							if (self.state.editing) {
								self.setState ({ editing: false });
							}
					}, 150);
			});
		}
	},

	handleEdit: function() {
		this.setState ({ editing: true });
	},
	
	handleSelected: function(val) {
		this.setState ({ editing: false });
		this.props.onSelected (val);
	},
	
	render: function() {
		if (!this.state.editing) {
			return (
				<div style={{position: "relative"}}>
					{this.props.children}
					<span onClick={this.handleEdit} className="glyphicon glyphicon-edit pull-right icon-hover"></span>
				</div>
			);
		} else {
			var typeaheadClasses = {
				input: "typeahead-input",
				results: "typeahead-results",
				listItem: "typeahead-item",
				listAnchor: "typeahead-anchor"
			};
		
			return this.transferPropsTo (<Typeahead ref="combo" customClasses={typeaheadClasses} onOptionSelected={this.handleSelected} />);
		}
	}
});

var Input = React.createClass({
	getInitialState: function() {
		return { editing: false };
	},

	getDefaultProps: function() {
		return {
			useEditIcon: false,
			onSave: function(val) { },
			preInput: function() { return null; },
		};
	},
	
	componentDidUpdate: function() {
		if (this.state.editing) {
			var node = this.refs.input.getDOMNode();
			$(node).focus();
			this.refs.input.getDOMNode().setSelectionRange(0, $(node).val().length);
		}
	},

	handleBlur: function() {
		this.setState ({ editing: false });
	},

	handleKeyUp: function(e) {
		if (e.keyCode == 27) {
			this.setState ({ editing: false });
		}
	},
	
	handleSave: function(e) {
		e.preventDefault();
		var val = $(this.refs.input.getDOMNode()).val();
		this.props.onSave (val);
		this.setState ({ editing: false });
	},

	startEdit: function(e) {
		e.preventDefault();
		e.stopPropagation();
		this.setState ({ editing: true });
	},
	
	render: function() {
		var noEdit;
		if (this.props.useEditIcon) {
			noEdit = (
				<div className="inline-block">
				{this.props.children}
				&nbsp;<span onClick={this.startEdit} className="glyphicon glyphicon-edit icon-hover" />
				</div>
			);
		} else {
			noEdit = <div onClick={this.startEdit}>{this.props.children}</div>;
		}
		
		if (!this.state.editing) {
			return noEdit;
		} else {
			var props = React.addons.update (this.props, { ref: {$set: "input"}});
			delete props.preInput;
			delete props.onSave;
			delete props.children;
			var child = React.addons.cloneWithProps (<input onBlur={this.handleBlur} onKeyUp={this.handleKeyUp} />, props);

			return (
				<form className="inline-block form-inline" onSubmit={this.handleSave} role="form">
				<div className="form-group">
					<div className="input-group">
					  {this.props.preInput}
						{child}
						<span onMouseDown={this.handleSave} className="input-group-addon btn-default glyphicon glyphicon-ok" />
					</div>
				</div>
				</form>
			);
		}
	},
});

module.exports = {
	Input: Input,
	Combo: Combo
};