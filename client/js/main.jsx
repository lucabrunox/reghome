/**
 * @jsx React.DOM
 */
'use strict';

require('../scss/main.scss');
require('../index.html');
/* require('bootstrap-sass/assets/javascripts/bootstrap.js'); */
require('script!jquery');
require('bootstrap');

var React = require('react');
var Router = require('react-router-component');

var Locations = Router.Locations;
var Location = Router.Location;
var NotFound = Router.NotFound;
var Link = Router.Link;

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

var BalancePage = React.createClass({

  render: function() {
    return (
      <div>
        <h1>Balance</h1>
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
    return (
<div className="container">
<nav className="navbar navbar-default" role="navigation">
  <div className="container-fluid">
    <div className="navbar-header">
      <Link href="/" className="navbar-brand">Dashboard</Link>
    </div>

    <div className="collapse navbar-collapse">
      <ul className="nav navbar-nav">
        <li><Link href="/balance">Balance</Link></li>
      </ul>
      <form className="navbar-form navbar-left form-inline" role="search">
        <div className="form-group">
          <input type="text" className="form-control" placeholder="Search"/>
        </div>&nbsp;
        <button type="submit" className="btn btn-default">Submit</button>
      </form>
    </div>
  </div>
</nav>
<Locations>
	<Location path="/" handler={MainPage} />
	<Location path="/balance" handler={BalancePage} />
	<NotFound handler={NotFoundHandler} />
</Locations>
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
