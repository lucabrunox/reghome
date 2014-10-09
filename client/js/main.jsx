/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
var Router = require('react-router-component');

/* var Pages       = ReactRouter.Pages; */
/* var Page        = ReactRouter.Page; */
var Locations = Router.Locations;
var Location = Router.Location;
var NotFound    = Router.NotFound;
var Link        = Router.Link;

var MainPage = React.createClass({

  render: function() {
    return (
      <div className="MainPage">
        <h1>Hello, anonymous!</h1>
        <p><Link href="/about">Login</Link></p>
      </div>
    );
  }

});

var AboutPage = React.createClass({

  render: function() {
    return (
      <div className="AboutPage">
        <h1>About...</h1>
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
      <Locations>
        <Location path="/" handler={MainPage} />
        <Location path="/about" handler={AboutPage} />
        <NotFound handler={NotFoundHandler} />
      </Locations>
    );
  }
  
});

module.exports = App;

if (typeof window !== 'undefined') {
  window.onload = function() {
	  React.renderComponent(App(), document.body);
  }
}
