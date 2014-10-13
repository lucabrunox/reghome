/**
 * @jsx React.DOM
 */
'use strict';

require('css/main.scss');
require('index.html');
/* require('bootstrap-sass/assets/javascripts/bootstrap.js'); */
require('script!jquery');
require('bootstrap');
var querystring = require('querystring');

var JournalPage = require('./journal.jsx');
var React = require('react');
var SimpleRouter = require('./router.jsx');
var Calculator = require('./calc.jsx');

var Router = SimpleRouter.Router;
var Route = SimpleRouter.Route;
var Link = SimpleRouter.Link;

var MainPage = React.createClass({

  render: function() {
    return (
      <div className="MainPage">
        <h1>Hello, anonymous!</h1>
        <p><Link href="/login">Login</Link></p>
      </div>
    );
  }

});

var LedgerPage = React.createClass({

  render: function() {
    return (
      <div>
        <h1>Ledger</h1>
      </div>
    );
  }

});

var NotFoundHandler = React.createClass({

  render: function() {
    return (
      <p>Page not found</p>
    );
  }
  
});

var App = React.createClass({

  render: function() {
		var qs = querystring.decode(location.search.slice(1));
		
    return (
<div className="container main">
<nav className="navbar navbar-default navbar-fixed-top" role="navigation">
  <div className="container-fluid">
    <div className="navbar-header">
      <Link href="/" className="navbar-brand">Dashboard</Link>
    </div>

    <div className="collapse navbar-collapse">
      <ul className="nav navbar-nav">
        <li><Link href="/journal">Journal</Link></li>
        <li><Link href="/ledger">Ledger</Link></li>
      </ul>
      <form className="navbar-form navbar-left form-inline" role="search">
        <div className="form-group">
          <input type="text" className="form-control" placeholder="Search"/>
        </div>
      </form>
			<Calculator className="navbar-form navbar-right" key="calculator" />
    </div>
  </div>
</nav>

<Router>
	<Route path="^$"><MainPage key="mainpage" /></Route>
	<Route path="^journal$"><JournalPage key="journalpage" /></Route>
</Router>
</div>			
    );
  }
  
});

module.exports = App;

if (typeof window !== 'undefined') {
  window.onload = function() {
	  React.renderComponent(App(), document.body);
  }
}
