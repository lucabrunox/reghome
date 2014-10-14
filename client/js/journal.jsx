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
var ECombo = Editable.Combo;

var JournalEntry = React.createClass({
	onDebitSave: function(val) {
		// optimistic update
		var num = parseFloat(Util.toFloat(val).toPrecision(12)).toFixed(2);
		var data = React.addons.update (this.props.data, { dare: {$set: num}});
		this.props.onChange (data);
	},

	onCreditSave: function(val) {
		// optimistic update
		var num = parseFloat(Util.toFloat(val).toPrecision(12)).toFixed(2);
		var data = React.addons.update (this.props.data, { avere: {$set: num}});
		this.props.onChange (data);
	},

	onNotesSave: function(val) {
		var data = React.addons.update (this.props.data, { note: {$set: val}});
		this.props.onChange (data);
	},

	onAccountSave: function(val) {
		console.log(val);
		var ac = Util.findElement (this.props.accounts, function(ac) {
				return ac.nome === val;
		});

		if (ac) {
			var data = React.addons.update (this.props.data,
																			{ conto_id: {$set: ac.id},
																				conto_nome: {$set: ac.nome} });
			this.props.onChange (data);
		}
	},
	
	render: function() {
		var data = this.props.data;
		var options = this.props.accounts.map(function(ac) {
				return ac.nome;
		});
		
		var ledgerHref = "/ledger/"+data.conto_id;
		var preInput = <span className="input-group-addon">&euro;</span>;

		var dare = data.dare == 0 ? <span className="text-muted">-</span> : "€ "+data.dare;
		var avere = data.avere == 0 ? <span className="text-muted">-</span> : "€ "+data.avere;
		var note = data.note ? data.note : <span className="text-muted">-</span>;

		return (
			<tr>
		  <td className="col-md-3">
			  <ECombo placeholder="Account name" options={options} maxVisible={2} onSelected={this.onAccountSave}>
			    <Link href={ledgerHref}>{data.conto_nome}</Link>
				</ECombo>
			</td>
			<td className="col-md-2">
				<EInput className="form-control" defaultValue={data.dare} onSave={this.onDebitSave} preInput={preInput}>
					{dare}
				</EInput>
			</td>
			<td className="col-md-2">
			  <EInput className="form-control" defaultValue={data.avere} onSave={this.onCreditSave} preInput={preInput}>
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

	handleClick: function() {
		if (this.state.expanded) {
			this.setState ({ expanded: false });
		} else {
			this.ajaxState ("/api/journal/"+this.props.data.id, function(data) {
				data.expanded = true;
			});
		}
	},

	handleChange: function(id) {
		var self = this;
		return function(newdata) {
			var i = Util.findIndex (self.state.data, function(row) {
					return row.id === id;
			});
			
			if (i >= 0) {
				var data = self.state.data.slice();
				data[i] = newdata;
				self.setState ({ data: data });
				Util.ajaxPost ("/api/journal/entry", newdata);
			}
		};
	},
	
	render: function() {
		var data = this.props.data;
		var head =
		  <tr onClick={this.handleClick}>
			<td className="col-md-3">{data.data}</td>
			<td colSpan={this.state.expanded ? 3 : 1} className="col-md-9">{data.note}</td>
			</tr>;

		if (this.state.expanded) {
			var balance = 0;
			var self = this;
			var rows = this.state.data.map (function (row) {
					balance += row.avere - row.dare;
					return <JournalEntry key={row.id} data={row} accounts={self.state.accounts} onChange={self.handleChange(row.id)} />;
			});
			var cls = balance != 0 ? "warning" : null;

			return (
				<tr className={cls}><td colSpan="2" className="col-md-12 td-nested">
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
