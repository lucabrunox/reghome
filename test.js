var Future = require('fibers/future');
var async = require('./lib/async.js');

var _pg = require('pg');
var conString = "postgres://lethal:Line27@localhost/casa";

wrapObject = function(obj, methods) {
  var wrapCache = {};
  var ret = {};
  for (var i=0; i < methods.length; i++) {
    var method = methods[i];
    var wrapper;
    if (typeof method == "string") {
      wrapper = Future.wrap(obj[method].bind(obj));
      ret[method] = function() { return wrapper.apply(null, arguments).wait(); };
    } else {
      wrapper = Future.wrap(obj[method[0]].bind(obj), "array");
      ret[method[0]] = function (names) {
        return function() {
          var arr = wrapper.apply(null, arguments).wait();
          var res = {};
          for (var j=1; j < names.length; j++) {
            res[names[j]] = arr[j-1];
          }
          return res;
        }
      }(method);
    }
  }

  return ret;
};

var pg = wrapObject(_pg, [["connect", "client", "done"]]);
var app = Future.task(function() {
  var conn = pg.connect(conString);
  var client = wrapObject (conn.client, ["query"]);
  var result = client.query('SELECT $1::int as number', ['1']);
  console.log(result);
  conn.done();
}).detach();

/*
pg.connect(conString, function(err, client, done) {
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
    client.end();
    //output: 1
  });
});*/
