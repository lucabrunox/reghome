reghome
=======

Simple home cash double entry

Installation
-----------

Install nix.

Clone this repository.

```
$ git clone https://github.com/lethalman/reghome.git
$ cd reghome
$ nix-shell
$ services/postgres/init.sh start
$ mkdir -p /home/luca/.reghome/nginx/logs
$ services/nginx/init.sh
$ forever start server/main.js $(pwd)/config.js
$ ./watch.sh
```
