/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
var SimpleRouter = require('./router.jsx');
var ErrorGuard = require('./error.jsx');
var ResultGuard = require('./emptyres.jsx');
var Pager = require('./pager.jsx');
var Loader = require('./loader.jsx');
var Util = require('./util.js');
var querystring = require('querystring');

var Link = SimpleRouter.Link;

var JournalEntry = React.createClass({
	getInitialState: function() {
		return {
			editingDebit: false,
		};
	},
	
	editDebit: function() {
		this.setState ({ editingDebit: true });
	},

	componentDidUpdate: function() {
		if (this.state.editingDebit) {
			$(this.refs.editInput.getDOMNode()).focus();
		}
	},

	handleBlur: function() {
		this.setState ({ editingDebit: false });
	},
	
	handleSave: function(e) {
		e.preventDefault();
		var val = $(this.refs.editInput.getDOMNode()).val();
		
		this.setState ({ editingDebit: false });
	},

	render: function() {
		var data = this.props.data;
		var ledgerHref = "/ledger/"+data.conto_id;
		var debitTd;
		if (!this.state.editingDebit) {
			debitTd = <td onClick={this.editDebit} className="col-md-2">{data.dare}</td>;
		} else {
			debitTd = (
				<form className="form-inline" onSubmit={this.handleSave} role="form">
				<div className="form-group">
					<div className="input-group">
						<span className="input-group-addon">&euro;</span>
						<input onBlur={this.handleBlur} ref="editInput" type="text" className="form-control" defaultValue={data.dare.substring(1).trim()} />
						<span onMouseDown={this.handleSave} className="input-group-addon btn-default glyphicon glyphicon-ok" />
					</div>
				</div>
				</form>
			);
		}
		
		return (
			<tr>
		  <td className="col-md-3"><Link href={ledgerHref}>{data.conto_nome}</Link></td>
			{debitTd}
			<td className="col-md-2">{data.avere}</td>
			<td className="col-md-5">{data.note}</td>
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
			<td className="col-md-3">{data.data}</td>
			<td colSpan={this.state.expanded ? 3 : 1} className="col-md-9">{data.note}</td>
			</tr>;

		if (this.state.expanded) {
			var rows = this.state.data.map (function (row) { return <JournalEntry key={row.id} data={row} />; });

			return (
				<tr><td colSpan="2" className="col-md-12 td-nested">
				  <table className="table-nested table-striped table-condensed">
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
		return {};
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
		var loaded = !$.isEmptyObject (this.state);
		
		var rows = [];
		if (this.state.data) {
			rows = this.state.data.map(function(row) {
					return <JournalDate key={row.id} data={row} />;
			});
		}

		var pager = <Pager page={this.props.route.query.page} />;
		
    return (
		  <div>
		    <h2>Journal</h2>
				<Loader loaded={loaded}>
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
				</Loader>
			</div>
    );
  }

});

module.exports = JournalPage;
