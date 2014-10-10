reghome
=======

Simple home cash double entry

Installation
-----------

Install nix.

```
$ git clone https://github.com/lethalman/reghome.git
$ cd reghome
$ nix-shell
```

Build the web bundle:
	
```
$ webpack
```

Start the services:
	
```
$ mkdir -p ~/.reghome/nginx/logs
$ services/nginx/init.sh
$ node server/main.js $(pwd)/config.js
```

Open http://localhost:8080
