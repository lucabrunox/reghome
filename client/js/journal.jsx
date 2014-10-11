/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
var ErrorGuard = require('./error.jsx');

var JournalPage = React.createClass({
	getInitialState: function() {
    return {data: []};
  },
	
  componentDidMount: function() {
		this.reloadData ();
	},

	reloadData: function() {
		$.ajax({
      url: "/api/journal",
      dataType: 'json',
      success: function(data) {
        this.setState(data);
      }.bind(this),
      error: function(xhr, status, err) {
				this.setState(xhr.responseJSON);
      }.bind(this)
    });
	},
	
  render: function() {
    return (
			<ErrorGuard error={this.state.error}>
      <div>
        <h1>Journal</h1>
				{this.state.data}
      </div>
			</ErrorGuard>
    );
  }

});

module.exports = JournalPage;
