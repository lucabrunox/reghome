/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
var ErrorGuard = require('./error.jsx');
var ResultGuard = require('./emptyres.jsx');
var Pager = require('./pager.jsx');
var Util = require('./util.js');
var querystring = require('querystring');

var JournalEntry = React.createClass({
	render: function() {
		var data = this.props.data;
		
		return (
			<tr>
		  <td className="col-md-1">{data.conto}</td>
			<td className="col-md-1">{data.dare}</td>
			<td className="col-md-1">{data.avere}</td>
			<td className="col-md-9">{data.note}</td>
			</tr>
		);
	}
});

var JournalDate = React.createClass({
	mixins: [ Util ],

	getInitialState: function() {
		return { expanded: false, data: [] };
	},

	shouldComponentUpdate: function(props, state) {
		return this.state.expanded != state.expanded;
	},
	
	handleClick: function() {
		if (this.state.expanded) {
			this.setState ({ expanded: false });
		} else {
			var self = this;
			this.ajaxState ("/api/journal/"+this.props.data.id, function(data) {
					data.expanded = true;
			});
		}
	},
		
	render: function() {
		var data = this.props.data;
		var head =
		  <tr onClick={this.handleClick}>
			<td colSpan={this.state.expanded ? 3 : 1} className="col-md-3">{data.data}</td>
			<td className="col-md-9">{data.note}</td>
			</tr>;

		if (this.state.expanded) {
			var rows = this.state.data.map (function (row) { return <JournalEntry data={row} />; });

			return (
				<tr><td colSpan="2" className="col-md-12 td-nested">
				  <table className="table-nested table-striped table-hover table-condensed">
					{head}
					{rows}
					</table>
				</td></tr>
			);
		} else {
			return head;
		}
	},
	
});

var JournalPage = React.createClass({
	mixins: [Util],
	
	getInitialState: function() {
    return {data: []};
  },

  componentWillMount: function() {
		this.reloadData (this.props);
	},

	componentWillReceiveProps: function(nextProps) {
		this.reloadData (nextProps);
	},

	reloadData: function(props) {
		this.ajaxState("/api/journal?page="+Util.toInt(props.route.query.page, 1));
	},
	
  render: function() {
		var rows = this.state.data.map(function(row) {
				return <JournalDate key={row.id} data={row} />;
		});

		var pager = <Pager page={this.props.route.query.page} />;
		
    return (
		  <div>
		    <h2>Journal</h2>
				<ErrorGuard error={this.state.error}>
					<ResultGuard data={this.state.data}>
					  <div>
						{pager}
						<table className="table table-striped table-hover table-condensed">
							<thead>
			 		 			<tr><th>Date</th><th>Notes</th></tr>
							</thead>
							<tbody>
							{rows}
							</tbody>
						</table>
						{pager}
						</div>
					</ResultGuard>
				</ErrorGuard>
			</div>
    );
  }

});

module.exports = JournalPage;
