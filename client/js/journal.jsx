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

var JournalDate = React.createClass({
	
	render: function() {
		var data = this.props.data;
		return (
			<tr>
			<td className="col-md-3">{data.data}</td>
			<td className="col-md-9">{data.note}</td>
			</tr>
		);
	},
	
});

var JournalPage = React.createClass({
	mixins: [Util],
	
	getInitialState: function() {
    return {data: []};
  },

  componentWillMount: function() {
		console.log(this.props);
		this.reloadData (this.props);
	},

	componentWillReceiveProps: function(nextProps) {
		console.log(nextProps);
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
