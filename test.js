var Fiber = require('fibers');
var Future = require('fibers/future');

var pg = require('pg');
var conString = "postgres://lethal:Line27@localhost/casa";

var future = function() {
   var ret = Future.wrap (pg.connect.bind(pg), "array") (conString).wait ();
   console.log(ret);
   return ret[1];
}.future();

future().resolve(function(err, done) { console.log(done); done(); });

/*pg.connect(conString, function(err, client, done) {
  if(err) {
    return console.error('error fetching client from pool', err);
  }
  client.query('SELECT $1::int AS number', ['1'], function(err, result) {
    //call `done()` to release the client back to the pool
    done();

    if(err) {
      return console.error('error running query', err);
    }
    console.log(result.rows[0].number);
    //output: 1
  });
});*/
