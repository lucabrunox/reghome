/**
 * @jsx React.DOM
 */
'use strict';

var React = require('react');
var Pages = require('react-router-component');
var Page = require('react-router-component');
var NotFound = require('react-router-component');
var Link = require('react-router-component');

/* var Pages       = ReactRouter.Pages; */
/* var Page        = ReactRouter.Page; */
/* var NotFound    = ReactRouter.NotFound; */
/* var Link        = ReactRouter.Link; */

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
      <Pages className="App" path={this.props.path}>
        <Page path="/" handler={MainPage} />
        <Page path="/about" handler={AboutPage} />
        <NotFound handler={NotFoundHandler} />
      </Pages>
    );
  }
  
});

module.exports = App;

if (typeof window !== 'undefined') {
  window.onload = function() {
	  React.renderComponent(App(), body);
  }
}
