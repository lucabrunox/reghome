/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
var SimpleRouter = require('./router.jsx');
var ErrorGuard = require('./error.jsx');
var Editable = require('./editable.jsx');
var ResultGuard = require('./emptyres.jsx');
var Pager = require('./pager.jsx');
var Loader = require('./loader.jsx');
var Util = require('./util.js');
var querystring = require('querystring');

var Link = SimpleRouter.Link;
var EInput = Editable.Input;

var JournalEntry = React.createClass({
	onDebitSave: function(val) {
		console.log ("debit save", val);
	},

	onCreditSave: function(val) {
		console.log ("credit save", val);
	},

	onNotesSave: function(val) {
		console.log ("notes save", val);
	},
	
	render: function() {
		var data = this.props.data;
		var ledgerHref = "/ledger/"+data.conto_id;
		var preInput = <span className="input-group-addon">&euro;</span>;
		var dare = data.dareval == 0 ? <span className="text-muted">-</span> : data.dare;
		var avere = data.avereval == 0 ? <span className="text-muted">-</span> : data.avere;
		var note = data.note ? data.note : <span className="text-muted">-</span>;
		
		return (
			<tr>
		  <td className="col-md-3"><Link href={ledgerHref}>{data.conto_nome}</Link></td>
			<td className="col-md-2">
				<EInput className="form-control" defaultValue={data.dare.substring(1).trim()} onSave={this.onDebitSave} preInput={preInput}>
					{dare}
				</EInput>
			</td>
			<td className="col-md-2">
			  <EInput className="form-control" defaultValue={data.avere.substring(1).trim()} onSave={this.onCreditSave} preInput={preInput}>
					{avere}
				</EInput>
			</td>
			<td className="col-md-5">
			  <EInput className="form-control" defaultValue={data.note} onSave={this.onNotesSave}>
					{note}
				</EInput>
			</td>
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
