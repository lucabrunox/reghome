{ self, fetchurl, fetchgit ? null, lib }:

{
  by-spec."accepts"."~1.1.0" =
    self.by-version."accepts"."1.1.1";
  by-version."accepts"."1.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "accepts-1.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/accepts/-/accepts-1.1.1.tgz";
        name = "accepts-1.1.1.tgz";
        sha1 = "3b40bf6abc3fe3bc004534f4672ae1efd0063a96";
      })
    ];
    buildInputs =
      (self.nativeDeps."accepts" or []);
    deps = {
      "mime-types-2.0.2" = self.by-version."mime-types"."2.0.2";
      "negotiator-0.4.8" = self.by-version."negotiator"."0.4.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "accepts" ];
  };
  by-spec."async"."0.1.x" =
    self.by-version."async"."0.1.22";
  by-version."async"."0.1.22" = lib.makeOverridable self.buildNodePackage {
    name = "async-0.1.22";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/async/-/async-0.1.22.tgz";
        name = "async-0.1.22.tgz";
        sha1 = "0fc1aaa088a0e3ef0ebe2d8831bab0dcf8845061";
      })
    ];
    buildInputs =
      (self.nativeDeps."async" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "async" ];
  };
  by-spec."async"."0.2.9" =
    self.by-version."async"."0.2.9";
  by-version."async"."0.2.9" = lib.makeOverridable self.buildNodePackage {
    name = "async-0.2.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/async/-/async-0.2.9.tgz";
        name = "async-0.2.9.tgz";
        sha1 = "df63060fbf3d33286a76aaf6d55a2986d9ff8619";
      })
    ];
    buildInputs =
      (self.nativeDeps."async" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "async" ];
  };
  by-spec."async"."0.2.x" =
    self.by-version."async"."0.2.10";
  by-version."async"."0.2.10" = lib.makeOverridable self.buildNodePackage {
    name = "async-0.2.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/async/-/async-0.2.10.tgz";
        name = "async-0.2.10.tgz";
        sha1 = "b6bbe0b0674b9d719708ca38de8c237cb526c3d1";
      })
    ];
    buildInputs =
      (self.nativeDeps."async" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "async" ];
  };
  by-spec."async"."~0.2.7" =
    self.by-version."async"."0.2.10";
  by-spec."async"."~0.2.9" =
    self.by-version."async"."0.2.10";
  by-spec."aws-sign"."~0.2.0" =
    self.by-version."aws-sign"."0.2.0";
  by-version."aws-sign"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "aws-sign-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/aws-sign/-/aws-sign-0.2.0.tgz";
        name = "aws-sign-0.2.0.tgz";
        sha1 = "c55013856c8194ec854a0cbec90aab5a04ce3ac5";
      })
    ];
    buildInputs =
      (self.nativeDeps."aws-sign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "aws-sign" ];
  };
  by-spec."bindings"."1.2.1" =
    self.by-version."bindings"."1.2.1";
  by-version."bindings"."1.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "bindings-1.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bindings/-/bindings-1.2.1.tgz";
        name = "bindings-1.2.1.tgz";
        sha1 = "14ad6113812d2d37d72e67b4cacb4bb726505f11";
      })
    ];
    buildInputs =
      (self.nativeDeps."bindings" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "bindings" ];
  };
  by-spec."boom"."0.3.x" =
    self.by-version."boom"."0.3.8";
  by-version."boom"."0.3.8" = lib.makeOverridable self.buildNodePackage {
    name = "boom-0.3.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/boom/-/boom-0.3.8.tgz";
        name = "boom-0.3.8.tgz";
        sha1 = "c8cdb041435912741628c044ecc732d1d17c09ea";
      })
    ];
    buildInputs =
      (self.nativeDeps."boom" or []);
    deps = {
      "hoek-0.7.6" = self.by-version."hoek"."0.7.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "boom" ];
  };
  by-spec."broadway"."0.2.9" =
    self.by-version."broadway"."0.2.9";
  by-version."broadway"."0.2.9" = lib.makeOverridable self.buildNodePackage {
    name = "broadway-0.2.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/broadway/-/broadway-0.2.9.tgz";
        name = "broadway-0.2.9.tgz";
        sha1 = "887008b2257f4171089de5cb9b656969b6c8c9e8";
      })
    ];
    buildInputs =
      (self.nativeDeps."broadway" or []);
    deps = {
      "cliff-0.1.8" = self.by-version."cliff"."0.1.8";
      "eventemitter2-0.4.12" = self.by-version."eventemitter2"."0.4.12";
      "nconf-0.6.9" = self.by-version."nconf"."0.6.9";
      "winston-0.7.2" = self.by-version."winston"."0.7.2";
      "utile-0.2.1" = self.by-version."utile"."0.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "broadway" ];
  };
  by-spec."broadway"."0.2.x" =
    self.by-version."broadway"."0.2.10";
  by-version."broadway"."0.2.10" = lib.makeOverridable self.buildNodePackage {
    name = "broadway-0.2.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/broadway/-/broadway-0.2.10.tgz";
        name = "broadway-0.2.10.tgz";
        sha1 = "0f58532be140426e9000e49a93e242a0d1263238";
      })
    ];
    buildInputs =
      (self.nativeDeps."broadway" or []);
    deps = {
      "cliff-0.1.8" = self.by-version."cliff"."0.1.8";
      "eventemitter2-0.4.14" = self.by-version."eventemitter2"."0.4.14";
      "nconf-0.6.9" = self.by-version."nconf"."0.6.9";
      "winston-0.7.2" = self.by-version."winston"."0.7.2";
      "utile-0.2.1" = self.by-version."utile"."0.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "broadway" ];
  };
  by-spec."buffer-writer"."1.0.0" =
    self.by-version."buffer-writer"."1.0.0";
  by-version."buffer-writer"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "buffer-writer-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/buffer-writer/-/buffer-writer-1.0.0.tgz";
        name = "buffer-writer-1.0.0.tgz";
        sha1 = "6c29c3b2dea0c9e455a1f261a199a48a04f88b08";
      })
    ];
    buildInputs =
      (self.nativeDeps."buffer-writer" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "buffer-writer" ];
  };
  by-spec."cliff"."0.1.8" =
    self.by-version."cliff"."0.1.8";
  by-version."cliff"."0.1.8" = lib.makeOverridable self.buildNodePackage {
    name = "cliff-0.1.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cliff/-/cliff-0.1.8.tgz";
        name = "cliff-0.1.8.tgz";
        sha1 = "43ca8ad9fe3943489693ab62dce0cae22509d272";
      })
    ];
    buildInputs =
      (self.nativeDeps."cliff" or []);
    deps = {
      "colors-0.6.2" = self.by-version."colors"."0.6.2";
      "eyes-0.1.8" = self.by-version."eyes"."0.1.8";
      "winston-0.6.2" = self.by-version."winston"."0.6.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cliff" ];
  };
  by-spec."colors"."0.6.x" =
    self.by-version."colors"."0.6.2";
  by-version."colors"."0.6.2" = lib.makeOverridable self.buildNodePackage {
    name = "colors-0.6.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/colors/-/colors-0.6.2.tgz";
        name = "colors-0.6.2.tgz";
        sha1 = "2423fe6678ac0c5dae8852e5d0e5be08c997abcc";
      })
    ];
    buildInputs =
      (self.nativeDeps."colors" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "colors" ];
  };
  by-spec."colors"."0.x.x" =
    self.by-version."colors"."0.6.2";
  by-spec."colors"."~0.6.2" =
    self.by-version."colors"."0.6.2";
  by-spec."combined-stream"."~0.0.4" =
    self.by-version."combined-stream"."0.0.5";
  by-version."combined-stream"."0.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "combined-stream-0.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/combined-stream/-/combined-stream-0.0.5.tgz";
        name = "combined-stream-0.0.5.tgz";
        sha1 = "29ed76e5c9aad07c4acf9ca3d32601cce28697a2";
      })
    ];
    buildInputs =
      (self.nativeDeps."combined-stream" or []);
    deps = {
      "delayed-stream-0.0.5" = self.by-version."delayed-stream"."0.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "combined-stream" ];
  };
  by-spec."cookie"."0.1.2" =
    self.by-version."cookie"."0.1.2";
  by-version."cookie"."0.1.2" = lib.makeOverridable self.buildNodePackage {
    name = "cookie-0.1.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cookie/-/cookie-0.1.2.tgz";
        name = "cookie-0.1.2.tgz";
        sha1 = "72fec3d24e48a3432073d90c12642005061004b1";
      })
    ];
    buildInputs =
      (self.nativeDeps."cookie" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "cookie" ];
  };
  by-spec."cookie-jar"."~0.2.0" =
    self.by-version."cookie-jar"."0.2.0";
  by-version."cookie-jar"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "cookie-jar-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cookie-jar/-/cookie-jar-0.2.0.tgz";
        name = "cookie-jar-0.2.0.tgz";
        sha1 = "64ecc06ac978db795e4b5290cbe48ba3781400fa";
      })
    ];
    buildInputs =
      (self.nativeDeps."cookie-jar" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "cookie-jar" ];
  };
  by-spec."cookie-signature"."1.0.5" =
    self.by-version."cookie-signature"."1.0.5";
  by-version."cookie-signature"."1.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "cookie-signature-1.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cookie-signature/-/cookie-signature-1.0.5.tgz";
        name = "cookie-signature-1.0.5.tgz";
        sha1 = "a122e3f1503eca0f5355795b0711bb2368d450f9";
      })
    ];
    buildInputs =
      (self.nativeDeps."cookie-signature" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "cookie-signature" ];
  };
  by-spec."crc"."3.0.0" =
    self.by-version."crc"."3.0.0";
  by-version."crc"."3.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "crc-3.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/crc/-/crc-3.0.0.tgz";
        name = "crc-3.0.0.tgz";
        sha1 = "d11e97ec44a844e5eb15a74fa2c7875d0aac4b22";
      })
    ];
    buildInputs =
      (self.nativeDeps."crc" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "crc" ];
  };
  by-spec."cryptiles"."0.1.x" =
    self.by-version."cryptiles"."0.1.3";
  by-version."cryptiles"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "cryptiles-0.1.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cryptiles/-/cryptiles-0.1.3.tgz";
        name = "cryptiles-0.1.3.tgz";
        sha1 = "1a556734f06d24ba34862ae9cb9e709a3afbff1c";
      })
    ];
    buildInputs =
      (self.nativeDeps."cryptiles" or []);
    deps = {
      "boom-0.3.8" = self.by-version."boom"."0.3.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cryptiles" ];
  };
  by-spec."cycle"."1.0.x" =
    self.by-version."cycle"."1.0.3";
  by-version."cycle"."1.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "cycle-1.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cycle/-/cycle-1.0.3.tgz";
        name = "cycle-1.0.3.tgz";
        sha1 = "21e80b2be8580f98b468f379430662b046c34ad2";
      })
    ];
    buildInputs =
      (self.nativeDeps."cycle" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "cycle" ];
  };
  by-spec."debug"."~2.0.0" =
    self.by-version."debug"."2.0.0";
  by-version."debug"."2.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "debug-2.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/debug/-/debug-2.0.0.tgz";
        name = "debug-2.0.0.tgz";
        sha1 = "89bd9df6732b51256bc6705342bba02ed12131ef";
      })
    ];
    buildInputs =
      (self.nativeDeps."debug" or []);
    deps = {
      "ms-0.6.2" = self.by-version."ms"."0.6.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "debug" ];
  };
  by-spec."deep-equal"."*" =
    self.by-version."deep-equal"."0.2.1";
  by-version."deep-equal"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "deep-equal-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/deep-equal/-/deep-equal-0.2.1.tgz";
        name = "deep-equal-0.2.1.tgz";
        sha1 = "fad7a793224cbf0c3c7786f92ef780e4fc8cc878";
      })
    ];
    buildInputs =
      (self.nativeDeps."deep-equal" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "deep-equal" ];
  };
  by-spec."delayed-stream"."0.0.5" =
    self.by-version."delayed-stream"."0.0.5";
  by-version."delayed-stream"."0.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "delayed-stream-0.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/delayed-stream/-/delayed-stream-0.0.5.tgz";
        name = "delayed-stream-0.0.5.tgz";
        sha1 = "d4b1f43a93e8296dfe02694f4680bc37a313c73f";
      })
    ];
    buildInputs =
      (self.nativeDeps."delayed-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "delayed-stream" ];
  };
  by-spec."depd"."0.4.5" =
    self.by-version."depd"."0.4.5";
  by-version."depd"."0.4.5" = lib.makeOverridable self.buildNodePackage {
    name = "depd-0.4.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/depd/-/depd-0.4.5.tgz";
        name = "depd-0.4.5.tgz";
        sha1 = "1a664b53388b4a6573e8ae67b5f767c693ca97f1";
      })
    ];
    buildInputs =
      (self.nativeDeps."depd" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "depd" ];
  };
  by-spec."destroy"."1.0.3" =
    self.by-version."destroy"."1.0.3";
  by-version."destroy"."1.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "destroy-1.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/destroy/-/destroy-1.0.3.tgz";
        name = "destroy-1.0.3.tgz";
        sha1 = "b433b4724e71fd8551d9885174851c5fc377e2c9";
      })
    ];
    buildInputs =
      (self.nativeDeps."destroy" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "destroy" ];
  };
  by-spec."director"."1.1.10" =
    self.by-version."director"."1.1.10";
  by-version."director"."1.1.10" = lib.makeOverridable self.buildNodePackage {
    name = "director-1.1.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/director/-/director-1.1.10.tgz";
        name = "director-1.1.10.tgz";
        sha1 = "e6c1d64f2f079216f19ea83b566035dde9901179";
      })
    ];
    buildInputs =
      (self.nativeDeps."director" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "director" ];
  };
  by-spec."ee-first"."1.0.5" =
    self.by-version."ee-first"."1.0.5";
  by-version."ee-first"."1.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "ee-first-1.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ee-first/-/ee-first-1.0.5.tgz";
        name = "ee-first-1.0.5.tgz";
        sha1 = "8c9b212898d8cd9f1a9436650ce7be202c9e9ff0";
      })
    ];
    buildInputs =
      (self.nativeDeps."ee-first" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ee-first" ];
  };
  by-spec."escape-html"."1.0.1" =
    self.by-version."escape-html"."1.0.1";
  by-version."escape-html"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "escape-html-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/escape-html/-/escape-html-1.0.1.tgz";
        name = "escape-html-1.0.1.tgz";
        sha1 = "181a286ead397a39a92857cfb1d43052e356bff0";
      })
    ];
    buildInputs =
      (self.nativeDeps."escape-html" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "escape-html" ];
  };
  by-spec."etag"."~1.4.0" =
    self.by-version."etag"."1.4.0";
  by-version."etag"."1.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "etag-1.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/etag/-/etag-1.4.0.tgz";
        name = "etag-1.4.0.tgz";
        sha1 = "3050991615857707c04119d075ba2088e0701225";
      })
    ];
    buildInputs =
      (self.nativeDeps."etag" or []);
    deps = {
      "crc-3.0.0" = self.by-version."crc"."3.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "etag" ];
  };
  by-spec."event-stream"."~0.5" =
    self.by-version."event-stream"."0.5.3";
  by-version."event-stream"."0.5.3" = lib.makeOverridable self.buildNodePackage {
    name = "event-stream-0.5.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/event-stream/-/event-stream-0.5.3.tgz";
        name = "event-stream-0.5.3.tgz";
        sha1 = "b77b9309f7107addfeab63f0c0eafd8db0bd8c1c";
      })
    ];
    buildInputs =
      (self.nativeDeps."event-stream" or []);
    deps = {
      "optimist-0.2.8" = self.by-version."optimist"."0.2.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "event-stream" ];
  };
  by-spec."eventemitter2"."0.4.12" =
    self.by-version."eventemitter2"."0.4.12";
  by-version."eventemitter2"."0.4.12" = lib.makeOverridable self.buildNodePackage {
    name = "eventemitter2-0.4.12";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/eventemitter2/-/eventemitter2-0.4.12.tgz";
        name = "eventemitter2-0.4.12.tgz";
        sha1 = "6cf14249fdc8799be7416e871e73fd2bb89e35e0";
      })
    ];
    buildInputs =
      (self.nativeDeps."eventemitter2" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "eventemitter2" ];
  };
  by-spec."eventemitter2"."0.4.14" =
    self.by-version."eventemitter2"."0.4.14";
  by-version."eventemitter2"."0.4.14" = lib.makeOverridable self.buildNodePackage {
    name = "eventemitter2-0.4.14";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/eventemitter2/-/eventemitter2-0.4.14.tgz";
        name = "eventemitter2-0.4.14.tgz";
        sha1 = "8f61b75cde012b2e9eb284d4545583b5643b61ab";
      })
    ];
    buildInputs =
      (self.nativeDeps."eventemitter2" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "eventemitter2" ];
  };
  by-spec."eventemitter2"."~0.4.11" =
    self.by-version."eventemitter2"."0.4.14";
  by-spec."expandenv"."*" =
    self.by-version."expandenv"."1.0.0";
  by-version."expandenv"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "expandenv-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/expandenv/-/expandenv-1.0.0.tgz";
        name = "expandenv-1.0.0.tgz";
        sha1 = "9ee8b19aed3cc882d527ac2cdfa15171f20e2aa7";
      })
    ];
    buildInputs =
      (self.nativeDeps."expandenv" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "expandenv" ];
  };
  "expandenv" = self.by-version."expandenv"."1.0.0";
  by-spec."express"."*" =
    self.by-version."express"."4.9.5";
  by-version."express"."4.9.5" = lib.makeOverridable self.buildNodePackage {
    name = "express-4.9.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/express/-/express-4.9.5.tgz";
        name = "express-4.9.5.tgz";
        sha1 = "7f62aa84ac8f5e96acfb98e2944dde0bf1cf8688";
      })
    ];
    buildInputs =
      (self.nativeDeps."express" or []);
    deps = {
      "accepts-1.1.1" = self.by-version."accepts"."1.1.1";
      "cookie-signature-1.0.5" = self.by-version."cookie-signature"."1.0.5";
      "debug-2.0.0" = self.by-version."debug"."2.0.0";
      "depd-0.4.5" = self.by-version."depd"."0.4.5";
      "escape-html-1.0.1" = self.by-version."escape-html"."1.0.1";
      "etag-1.4.0" = self.by-version."etag"."1.4.0";
      "finalhandler-0.2.0" = self.by-version."finalhandler"."0.2.0";
      "fresh-0.2.4" = self.by-version."fresh"."0.2.4";
      "media-typer-0.3.0" = self.by-version."media-typer"."0.3.0";
      "methods-1.1.0" = self.by-version."methods"."1.1.0";
      "on-finished-2.1.0" = self.by-version."on-finished"."2.1.0";
      "parseurl-1.3.0" = self.by-version."parseurl"."1.3.0";
      "path-to-regexp-0.1.3" = self.by-version."path-to-regexp"."0.1.3";
      "proxy-addr-1.0.3" = self.by-version."proxy-addr"."1.0.3";
      "qs-2.2.4" = self.by-version."qs"."2.2.4";
      "range-parser-1.0.2" = self.by-version."range-parser"."1.0.2";
      "send-0.9.3" = self.by-version."send"."0.9.3";
      "serve-static-1.6.4" = self.by-version."serve-static"."1.6.4";
      "type-is-1.5.2" = self.by-version."type-is"."1.5.2";
      "vary-1.0.0" = self.by-version."vary"."1.0.0";
      "cookie-0.1.2" = self.by-version."cookie"."0.1.2";
      "merge-descriptors-0.0.2" = self.by-version."merge-descriptors"."0.0.2";
      "utils-merge-1.0.0" = self.by-version."utils-merge"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "express" ];
  };
  "express" = self.by-version."express"."4.9.5";
  by-spec."eyes"."0.1.x" =
    self.by-version."eyes"."0.1.8";
  by-version."eyes"."0.1.8" = lib.makeOverridable self.buildNodePackage {
    name = "eyes-0.1.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/eyes/-/eyes-0.1.8.tgz";
        name = "eyes-0.1.8.tgz";
        sha1 = "62cf120234c683785d902348a800ef3e0cc20bc0";
      })
    ];
    buildInputs =
      (self.nativeDeps."eyes" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "eyes" ];
  };
  by-spec."fibers"."*" =
    self.by-version."fibers"."1.0.2";
  by-version."fibers"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "fibers-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fibers/-/fibers-1.0.2.tgz";
        name = "fibers-1.0.2.tgz";
        sha1 = "5e24eb5bd929c2be607047dbf88fa758514d3927";
      })
    ];
    buildInputs =
      (self.nativeDeps."fibers" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "fibers" ];
  };
  "fibers" = self.by-version."fibers"."1.0.2";
  by-spec."finalhandler"."0.2.0" =
    self.by-version."finalhandler"."0.2.0";
  by-version."finalhandler"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "finalhandler-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/finalhandler/-/finalhandler-0.2.0.tgz";
        name = "finalhandler-0.2.0.tgz";
        sha1 = "794082424b17f6a4b2a0eda39f9db6948ee4be8d";
      })
    ];
    buildInputs =
      (self.nativeDeps."finalhandler" or []);
    deps = {
      "debug-2.0.0" = self.by-version."debug"."2.0.0";
      "escape-html-1.0.1" = self.by-version."escape-html"."1.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "finalhandler" ];
  };
  by-spec."flatiron"."~0.3.11" =
    self.by-version."flatiron"."0.3.11";
  by-version."flatiron"."0.3.11" = lib.makeOverridable self.buildNodePackage {
    name = "flatiron-0.3.11";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/flatiron/-/flatiron-0.3.11.tgz";
        name = "flatiron-0.3.11.tgz";
        sha1 = "1cb0190fc2bd9d860f018e04d95fd35f9bd12555";
      })
    ];
    buildInputs =
      (self.nativeDeps."flatiron" or []);
    deps = {
      "broadway-0.2.9" = self.by-version."broadway"."0.2.9";
      "optimist-0.6.0" = self.by-version."optimist"."0.6.0";
      "prompt-0.2.11" = self.by-version."prompt"."0.2.11";
      "director-1.1.10" = self.by-version."director"."1.1.10";
    };
    peerDependencies = [
    ];
    passthru.names = [ "flatiron" ];
  };
  by-spec."forever"."*" =
    self.by-version."forever"."0.11.1";
  by-version."forever"."0.11.1" = lib.makeOverridable self.buildNodePackage {
    name = "forever-0.11.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/forever/-/forever-0.11.1.tgz";
        name = "forever-0.11.1.tgz";
        sha1 = "50ac8744c0a6e0c266524c4746397f74d6b09c5b";
      })
    ];
    buildInputs =
      (self.nativeDeps."forever" or []);
    deps = {
      "colors-0.6.2" = self.by-version."colors"."0.6.2";
      "cliff-0.1.8" = self.by-version."cliff"."0.1.8";
      "flatiron-0.3.11" = self.by-version."flatiron"."0.3.11";
      "forever-monitor-1.2.3" = self.by-version."forever-monitor"."1.2.3";
      "nconf-0.6.9" = self.by-version."nconf"."0.6.9";
      "nssocket-0.5.1" = self.by-version."nssocket"."0.5.1";
      "optimist-0.6.1" = self.by-version."optimist"."0.6.1";
      "pkginfo-0.3.0" = self.by-version."pkginfo"."0.3.0";
      "timespan-2.3.0" = self.by-version."timespan"."2.3.0";
      "watch-0.8.0" = self.by-version."watch"."0.8.0";
      "utile-0.2.1" = self.by-version."utile"."0.2.1";
      "winston-0.7.3" = self.by-version."winston"."0.7.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "forever" ];
  };
  "forever" = self.by-version."forever"."0.11.1";
  by-spec."forever-agent"."~0.2.0" =
    self.by-version."forever-agent"."0.2.0";
  by-version."forever-agent"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "forever-agent-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/forever-agent/-/forever-agent-0.2.0.tgz";
        name = "forever-agent-0.2.0.tgz";
        sha1 = "e1c25c7ad44e09c38f233876c76fcc24ff843b1f";
      })
    ];
    buildInputs =
      (self.nativeDeps."forever-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "forever-agent" ];
  };
  by-spec."forever-monitor"."1.2.3" =
    self.by-version."forever-monitor"."1.2.3";
  by-version."forever-monitor"."1.2.3" = lib.makeOverridable self.buildNodePackage {
    name = "forever-monitor-1.2.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/forever-monitor/-/forever-monitor-1.2.3.tgz";
        name = "forever-monitor-1.2.3.tgz";
        sha1 = "b27ac3acb6fdcc7315d6cd85830f2d004733028b";
      })
    ];
    buildInputs =
      (self.nativeDeps."forever-monitor" or []);
    deps = {
      "broadway-0.2.10" = self.by-version."broadway"."0.2.10";
      "minimatch-0.2.14" = self.by-version."minimatch"."0.2.14";
      "pkginfo-0.3.0" = self.by-version."pkginfo"."0.3.0";
      "ps-tree-0.0.3" = self.by-version."ps-tree"."0.0.3";
      "watch-0.5.1" = self.by-version."watch"."0.5.1";
      "utile-0.1.7" = self.by-version."utile"."0.1.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "forever-monitor" ];
  };
  by-spec."form-data"."~0.0.3" =
    self.by-version."form-data"."0.0.10";
  by-version."form-data"."0.0.10" = lib.makeOverridable self.buildNodePackage {
    name = "form-data-0.0.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/form-data/-/form-data-0.0.10.tgz";
        name = "form-data-0.0.10.tgz";
        sha1 = "db345a5378d86aeeb1ed5d553b869ac192d2f5ed";
      })
    ];
    buildInputs =
      (self.nativeDeps."form-data" or []);
    deps = {
      "combined-stream-0.0.5" = self.by-version."combined-stream"."0.0.5";
      "mime-1.2.11" = self.by-version."mime"."1.2.11";
      "async-0.2.10" = self.by-version."async"."0.2.10";
    };
    peerDependencies = [
    ];
    passthru.names = [ "form-data" ];
  };
  by-spec."forwarded"."~0.1.0" =
    self.by-version."forwarded"."0.1.0";
  by-version."forwarded"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "forwarded-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/forwarded/-/forwarded-0.1.0.tgz";
        name = "forwarded-0.1.0.tgz";
        sha1 = "19ef9874c4ae1c297bcf078fde63a09b66a84363";
      })
    ];
    buildInputs =
      (self.nativeDeps."forwarded" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "forwarded" ];
  };
  by-spec."fresh"."0.2.4" =
    self.by-version."fresh"."0.2.4";
  by-version."fresh"."0.2.4" = lib.makeOverridable self.buildNodePackage {
    name = "fresh-0.2.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fresh/-/fresh-0.2.4.tgz";
        name = "fresh-0.2.4.tgz";
        sha1 = "3582499206c9723714190edd74b4604feb4a614c";
      })
    ];
    buildInputs =
      (self.nativeDeps."fresh" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "fresh" ];
  };
  by-spec."generic-pool"."2.1.1" =
    self.by-version."generic-pool"."2.1.1";
  by-version."generic-pool"."2.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "generic-pool-2.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/generic-pool/-/generic-pool-2.1.1.tgz";
        name = "generic-pool-2.1.1.tgz";
        sha1 = "af04dc2c325cfcb975023fa52bfce9617a7435fd";
      })
    ];
    buildInputs =
      (self.nativeDeps."generic-pool" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "generic-pool" ];
  };
  by-spec."hawk"."~0.10.2" =
    self.by-version."hawk"."0.10.2";
  by-version."hawk"."0.10.2" = lib.makeOverridable self.buildNodePackage {
    name = "hawk-0.10.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hawk/-/hawk-0.10.2.tgz";
        name = "hawk-0.10.2.tgz";
        sha1 = "9b361dee95a931640e6d504e05609a8fc3ac45d2";
      })
    ];
    buildInputs =
      (self.nativeDeps."hawk" or []);
    deps = {
      "hoek-0.7.6" = self.by-version."hoek"."0.7.6";
      "boom-0.3.8" = self.by-version."boom"."0.3.8";
      "cryptiles-0.1.3" = self.by-version."cryptiles"."0.1.3";
      "sntp-0.1.4" = self.by-version."sntp"."0.1.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "hawk" ];
  };
  by-spec."hoek"."0.7.x" =
    self.by-version."hoek"."0.7.6";
  by-version."hoek"."0.7.6" = lib.makeOverridable self.buildNodePackage {
    name = "hoek-0.7.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hoek/-/hoek-0.7.6.tgz";
        name = "hoek-0.7.6.tgz";
        sha1 = "60fbd904557541cd2b8795abf308a1b3770e155a";
      })
    ];
    buildInputs =
      (self.nativeDeps."hoek" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "hoek" ];
  };
  by-spec."i"."0.3.x" =
    self.by-version."i"."0.3.2";
  by-version."i"."0.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "i-0.3.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/i/-/i-0.3.2.tgz";
        name = "i-0.3.2.tgz";
        sha1 = "b2e2d6ef47900bd924e281231ff4c5cc798d9ea8";
      })
    ];
    buildInputs =
      (self.nativeDeps."i" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "i" ];
  };
  by-spec."ini"."1.x.x" =
    self.by-version."ini"."1.3.0";
  by-version."ini"."1.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "ini-1.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ini/-/ini-1.3.0.tgz";
        name = "ini-1.3.0.tgz";
        sha1 = "625483e56c643a7721014c76604d3353f44bd429";
      })
    ];
    buildInputs =
      (self.nativeDeps."ini" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ini" ];
  };
  by-spec."ipaddr.js"."0.1.3" =
    self.by-version."ipaddr.js"."0.1.3";
  by-version."ipaddr.js"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "ipaddr.js-0.1.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ipaddr.js/-/ipaddr.js-0.1.3.tgz";
        name = "ipaddr.js-0.1.3.tgz";
        sha1 = "27a9ca37f148d2102b0ef191ccbf2c51a8f025c6";
      })
    ];
    buildInputs =
      (self.nativeDeps."ipaddr.js" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ipaddr.js" ];
  };
  by-spec."json-stringify-safe"."~3.0.0" =
    self.by-version."json-stringify-safe"."3.0.0";
  by-version."json-stringify-safe"."3.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "json-stringify-safe-3.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-3.0.0.tgz";
        name = "json-stringify-safe-3.0.0.tgz";
        sha1 = "9db7b0e530c7f289c5e8c8432af191c2ff75a5b3";
      })
    ];
    buildInputs =
      (self.nativeDeps."json-stringify-safe" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "json-stringify-safe" ];
  };
  by-spec."lazy"."~1.0.11" =
    self.by-version."lazy"."1.0.11";
  by-version."lazy"."1.0.11" = lib.makeOverridable self.buildNodePackage {
    name = "lazy-1.0.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lazy/-/lazy-1.0.11.tgz";
        name = "lazy-1.0.11.tgz";
        sha1 = "daa068206282542c088288e975c297c1ae77b690";
      })
    ];
    buildInputs =
      (self.nativeDeps."lazy" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lazy" ];
  };
  by-spec."lru-cache"."2" =
    self.by-version."lru-cache"."2.5.0";
  by-version."lru-cache"."2.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "lru-cache-2.5.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lru-cache/-/lru-cache-2.5.0.tgz";
        name = "lru-cache-2.5.0.tgz";
        sha1 = "d82388ae9c960becbea0c73bb9eb79b6c6ce9aeb";
      })
    ];
    buildInputs =
      (self.nativeDeps."lru-cache" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lru-cache" ];
  };
  by-spec."media-typer"."0.3.0" =
    self.by-version."media-typer"."0.3.0";
  by-version."media-typer"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "media-typer-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz";
        name = "media-typer-0.3.0.tgz";
        sha1 = "8710d7af0aa626f8fffa1ce00168545263255748";
      })
    ];
    buildInputs =
      (self.nativeDeps."media-typer" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "media-typer" ];
  };
  by-spec."merge-descriptors"."0.0.2" =
    self.by-version."merge-descriptors"."0.0.2";
  by-version."merge-descriptors"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "merge-descriptors-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/merge-descriptors/-/merge-descriptors-0.0.2.tgz";
        name = "merge-descriptors-0.0.2.tgz";
        sha1 = "c36a52a781437513c57275f39dd9d317514ac8c7";
      })
    ];
    buildInputs =
      (self.nativeDeps."merge-descriptors" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "merge-descriptors" ];
  };
  by-spec."methods"."1.1.0" =
    self.by-version."methods"."1.1.0";
  by-version."methods"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "methods-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/methods/-/methods-1.1.0.tgz";
        name = "methods-1.1.0.tgz";
        sha1 = "5dca4ee12df52ff3b056145986a8f01cbc86436f";
      })
    ];
    buildInputs =
      (self.nativeDeps."methods" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "methods" ];
  };
  by-spec."mime"."1.2.11" =
    self.by-version."mime"."1.2.11";
  by-version."mime"."1.2.11" = lib.makeOverridable self.buildNodePackage {
    name = "mime-1.2.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime/-/mime-1.2.11.tgz";
        name = "mime-1.2.11.tgz";
        sha1 = "58203eed86e3a5ef17aed2b7d9ebd47f0a60dd10";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime" ];
  };
  by-spec."mime"."~1.2.2" =
    self.by-version."mime"."1.2.11";
  by-spec."mime"."~1.2.7" =
    self.by-version."mime"."1.2.11";
  by-spec."mime-db"."~1.1.0" =
    self.by-version."mime-db"."1.1.0";
  by-version."mime-db"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "mime-db-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime-db/-/mime-db-1.1.0.tgz";
        name = "mime-db-1.1.0.tgz";
        sha1 = "4613f418ab995450bf4bda240cd0ab38016a07a9";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime-db" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime-db" ];
  };
  by-spec."mime-types"."~2.0.2" =
    self.by-version."mime-types"."2.0.2";
  by-version."mime-types"."2.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "mime-types-2.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime-types/-/mime-types-2.0.2.tgz";
        name = "mime-types-2.0.2.tgz";
        sha1 = "c74b779f2896c367888622bd537aaaad4c0a2c08";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime-types" or []);
    deps = {
      "mime-db-1.1.0" = self.by-version."mime-db"."1.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime-types" ];
  };
  by-spec."minimatch"."0.2.x" =
    self.by-version."minimatch"."0.2.14";
  by-version."minimatch"."0.2.14" = lib.makeOverridable self.buildNodePackage {
    name = "minimatch-0.2.14";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimatch/-/minimatch-0.2.14.tgz";
        name = "minimatch-0.2.14.tgz";
        sha1 = "c74e780574f63c6f9a090e90efbe6ef53a6a756a";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimatch" or []);
    deps = {
      "lru-cache-2.5.0" = self.by-version."lru-cache"."2.5.0";
      "sigmund-1.0.0" = self.by-version."sigmund"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimatch" ];
  };
  by-spec."minimist"."0.0.8" =
    self.by-version."minimist"."0.0.8";
  by-version."minimist"."0.0.8" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-0.0.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz";
        name = "minimist-0.0.8.tgz";
        sha1 = "857fcabfc3397d2625b8228262e86aa7a011b05d";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."minimist"."~0.0.1" =
    self.by-version."minimist"."0.0.10";
  by-version."minimist"."0.0.10" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-0.0.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-0.0.10.tgz";
        name = "minimist-0.0.10.tgz";
        sha1 = "de3f98543dbf96082be48ad1a0c7cda836301dcf";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."mkdirp"."0.x.x" =
    self.by-version."mkdirp"."0.5.0";
  by-version."mkdirp"."0.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "mkdirp-0.5.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.5.0.tgz";
        name = "mkdirp-0.5.0.tgz";
        sha1 = "1d73076a6df986cd9344e15e71fcc05a4c9abf12";
      })
    ];
    buildInputs =
      (self.nativeDeps."mkdirp" or []);
    deps = {
      "minimist-0.0.8" = self.by-version."minimist"."0.0.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "mkdirp" ];
  };
  by-spec."ms"."0.6.2" =
    self.by-version."ms"."0.6.2";
  by-version."ms"."0.6.2" = lib.makeOverridable self.buildNodePackage {
    name = "ms-0.6.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ms/-/ms-0.6.2.tgz";
        name = "ms-0.6.2.tgz";
        sha1 = "d89c2124c6fdc1353d65a8b77bf1aac4b193708c";
      })
    ];
    buildInputs =
      (self.nativeDeps."ms" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ms" ];
  };
  by-spec."mute-stream"."~0.0.4" =
    self.by-version."mute-stream"."0.0.4";
  by-version."mute-stream"."0.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "mute-stream-0.0.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mute-stream/-/mute-stream-0.0.4.tgz";
        name = "mute-stream-0.0.4.tgz";
        sha1 = "a9219960a6d5d5d046597aee51252c6655f7177e";
      })
    ];
    buildInputs =
      (self.nativeDeps."mute-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mute-stream" ];
  };
  by-spec."nan"."1.3.0" =
    self.by-version."nan"."1.3.0";
  by-version."nan"."1.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "nan-1.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nan/-/nan-1.3.0.tgz";
        name = "nan-1.3.0.tgz";
        sha1 = "9a5b8d5ef97a10df3050e59b2c362d3baf779742";
      })
    ];
    buildInputs =
      (self.nativeDeps."nan" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "nan" ];
  };
  by-spec."nconf"."0.6.9" =
    self.by-version."nconf"."0.6.9";
  by-version."nconf"."0.6.9" = lib.makeOverridable self.buildNodePackage {
    name = "nconf-0.6.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nconf/-/nconf-0.6.9.tgz";
        name = "nconf-0.6.9.tgz";
        sha1 = "9570ef15ed6f9ae6b2b3c8d5e71b66d3193cd661";
      })
    ];
    buildInputs =
      (self.nativeDeps."nconf" or []);
    deps = {
      "async-0.2.9" = self.by-version."async"."0.2.9";
      "ini-1.3.0" = self.by-version."ini"."1.3.0";
      "optimist-0.6.0" = self.by-version."optimist"."0.6.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "nconf" ];
  };
  by-spec."nconf"."~0.6.9" =
    self.by-version."nconf"."0.6.9";
  by-spec."ncp"."0.2.x" =
    self.by-version."ncp"."0.2.7";
  by-version."ncp"."0.2.7" = lib.makeOverridable self.buildNodePackage {
    name = "ncp-0.2.7";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ncp/-/ncp-0.2.7.tgz";
        name = "ncp-0.2.7.tgz";
        sha1 = "46fac2b7dda2560a4cb7e628677bd5f64eac5be1";
      })
    ];
    buildInputs =
      (self.nativeDeps."ncp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ncp" ];
  };
  by-spec."ncp"."0.4.x" =
    self.by-version."ncp"."0.4.2";
  by-version."ncp"."0.4.2" = lib.makeOverridable self.buildNodePackage {
    name = "ncp-0.4.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ncp/-/ncp-0.4.2.tgz";
        name = "ncp-0.4.2.tgz";
        sha1 = "abcc6cbd3ec2ed2a729ff6e7c1fa8f01784a8574";
      })
    ];
    buildInputs =
      (self.nativeDeps."ncp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ncp" ];
  };
  by-spec."negotiator"."0.4.8" =
    self.by-version."negotiator"."0.4.8";
  by-version."negotiator"."0.4.8" = lib.makeOverridable self.buildNodePackage {
    name = "negotiator-0.4.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/negotiator/-/negotiator-0.4.8.tgz";
        name = "negotiator-0.4.8.tgz";
        sha1 = "96010b23b63c387f47a4bed96762a831cda39eab";
      })
    ];
    buildInputs =
      (self.nativeDeps."negotiator" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "negotiator" ];
  };
  by-spec."node-uuid"."~1.4.0" =
    self.by-version."node-uuid"."1.4.1";
  by-version."node-uuid"."1.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "node-uuid-1.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/node-uuid/-/node-uuid-1.4.1.tgz";
        name = "node-uuid-1.4.1.tgz";
        sha1 = "39aef510e5889a3dca9c895b506c73aae1bac048";
      })
    ];
    buildInputs =
      (self.nativeDeps."node-uuid" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "node-uuid" ];
  };
  by-spec."nssocket"."~0.5.1" =
    self.by-version."nssocket"."0.5.1";
  by-version."nssocket"."0.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "nssocket-0.5.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nssocket/-/nssocket-0.5.1.tgz";
        name = "nssocket-0.5.1.tgz";
        sha1 = "11f0428335ad8d89ff9cf96ab2852a23b1b33b71";
      })
    ];
    buildInputs =
      (self.nativeDeps."nssocket" or []);
    deps = {
      "eventemitter2-0.4.14" = self.by-version."eventemitter2"."0.4.14";
      "lazy-1.0.11" = self.by-version."lazy"."1.0.11";
    };
    peerDependencies = [
    ];
    passthru.names = [ "nssocket" ];
  };
  by-spec."oauth-sign"."~0.2.0" =
    self.by-version."oauth-sign"."0.2.0";
  by-version."oauth-sign"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "oauth-sign-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/oauth-sign/-/oauth-sign-0.2.0.tgz";
        name = "oauth-sign-0.2.0.tgz";
        sha1 = "a0e6a1715daed062f322b622b7fe5afd1035b6e2";
      })
    ];
    buildInputs =
      (self.nativeDeps."oauth-sign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "oauth-sign" ];
  };
  by-spec."on-finished"."2.1.0" =
    self.by-version."on-finished"."2.1.0";
  by-version."on-finished"."2.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "on-finished-2.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/on-finished/-/on-finished-2.1.0.tgz";
        name = "on-finished-2.1.0.tgz";
        sha1 = "0c539f09291e8ffadde0c8a25850fb2cedc7022d";
      })
    ];
    buildInputs =
      (self.nativeDeps."on-finished" or []);
    deps = {
      "ee-first-1.0.5" = self.by-version."ee-first"."1.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "on-finished" ];
  };
  by-spec."on-finished"."~2.1.0" =
    self.by-version."on-finished"."2.1.0";
  by-spec."optimist"."0.2" =
    self.by-version."optimist"."0.2.8";
  by-version."optimist"."0.2.8" = lib.makeOverridable self.buildNodePackage {
    name = "optimist-0.2.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/optimist/-/optimist-0.2.8.tgz";
        name = "optimist-0.2.8.tgz";
        sha1 = "e981ab7e268b457948593b55674c099a815cac31";
      })
    ];
    buildInputs =
      (self.nativeDeps."optimist" or []);
    deps = {
      "wordwrap-0.0.2" = self.by-version."wordwrap"."0.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "optimist" ];
  };
  by-spec."optimist"."0.6.0" =
    self.by-version."optimist"."0.6.0";
  by-version."optimist"."0.6.0" = lib.makeOverridable self.buildNodePackage {
    name = "optimist-0.6.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/optimist/-/optimist-0.6.0.tgz";
        name = "optimist-0.6.0.tgz";
        sha1 = "69424826f3405f79f142e6fc3d9ae58d4dbb9200";
      })
    ];
    buildInputs =
      (self.nativeDeps."optimist" or []);
    deps = {
      "wordwrap-0.0.2" = self.by-version."wordwrap"."0.0.2";
      "minimist-0.0.10" = self.by-version."minimist"."0.0.10";
    };
    peerDependencies = [
    ];
    passthru.names = [ "optimist" ];
  };
  by-spec."optimist"."~0.6.0" =
    self.by-version."optimist"."0.6.1";
  by-version."optimist"."0.6.1" = lib.makeOverridable self.buildNodePackage {
    name = "optimist-0.6.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/optimist/-/optimist-0.6.1.tgz";
        name = "optimist-0.6.1.tgz";
        sha1 = "da3ea74686fa21a19a111c326e90eb15a0196686";
      })
    ];
    buildInputs =
      (self.nativeDeps."optimist" or []);
    deps = {
      "wordwrap-0.0.2" = self.by-version."wordwrap"."0.0.2";
      "minimist-0.0.10" = self.by-version."minimist"."0.0.10";
    };
    peerDependencies = [
    ];
    passthru.names = [ "optimist" ];
  };
  by-spec."packet-reader"."0.2.0" =
    self.by-version."packet-reader"."0.2.0";
  by-version."packet-reader"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "packet-reader-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/packet-reader/-/packet-reader-0.2.0.tgz";
        name = "packet-reader-0.2.0.tgz";
        sha1 = "819df4d010b82d5ea5671f8a1a3acf039bcd7700";
      })
    ];
    buildInputs =
      (self.nativeDeps."packet-reader" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "packet-reader" ];
  };
  by-spec."parseurl"."~1.3.0" =
    self.by-version."parseurl"."1.3.0";
  by-version."parseurl"."1.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "parseurl-1.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/parseurl/-/parseurl-1.3.0.tgz";
        name = "parseurl-1.3.0.tgz";
        sha1 = "b58046db4223e145afa76009e61bac87cc2281b3";
      })
    ];
    buildInputs =
      (self.nativeDeps."parseurl" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "parseurl" ];
  };
  by-spec."path-to-regexp"."0.1.3" =
    self.by-version."path-to-regexp"."0.1.3";
  by-version."path-to-regexp"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "path-to-regexp-0.1.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/path-to-regexp/-/path-to-regexp-0.1.3.tgz";
        name = "path-to-regexp-0.1.3.tgz";
        sha1 = "21b9ab82274279de25b156ea08fd12ca51b8aecb";
      })
    ];
    buildInputs =
      (self.nativeDeps."path-to-regexp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "path-to-regexp" ];
  };
  by-spec."pg"."*" =
    self.by-version."pg"."3.5.0";
  by-version."pg"."3.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "pg-3.5.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/pg/-/pg-3.5.0.tgz";
        name = "pg-3.5.0.tgz";
        sha1 = "aa06ab18f41fe26844d9193dd93d8594d0a952e4";
      })
    ];
    buildInputs =
      (self.nativeDeps."pg" or []);
    deps = {
      "bindings-1.2.1" = self.by-version."bindings"."1.2.1";
      "buffer-writer-1.0.0" = self.by-version."buffer-writer"."1.0.0";
      "generic-pool-2.1.1" = self.by-version."generic-pool"."2.1.1";
      "nan-1.3.0" = self.by-version."nan"."1.3.0";
      "packet-reader-0.2.0" = self.by-version."packet-reader"."0.2.0";
      "pg-connection-string-0.1.3" = self.by-version."pg-connection-string"."0.1.3";
      "pg-types-1.5.0" = self.by-version."pg-types"."1.5.0";
      "pgpass-0.0.3" = self.by-version."pgpass"."0.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "pg" ];
  };
  "pg" = self.by-version."pg"."3.5.0";
  by-spec."pg-connection-string"."0.1.3" =
    self.by-version."pg-connection-string"."0.1.3";
  by-version."pg-connection-string"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "pg-connection-string-0.1.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/pg-connection-string/-/pg-connection-string-0.1.3.tgz";
        name = "pg-connection-string-0.1.3.tgz";
        sha1 = "da1847b20940e42ee1492beaf65d49d91b245df7";
      })
    ];
    buildInputs =
      (self.nativeDeps."pg-connection-string" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "pg-connection-string" ];
  };
  by-spec."pg-types"."1.5.0" =
    self.by-version."pg-types"."1.5.0";
  by-version."pg-types"."1.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "pg-types-1.5.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/pg-types/-/pg-types-1.5.0.tgz";
        name = "pg-types-1.5.0.tgz";
        sha1 = "0a9d7146bac89bf447231e1c82fd526a5e730ab5";
      })
    ];
    buildInputs =
      (self.nativeDeps."pg-types" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "pg-types" ];
  };
  by-spec."pgpass"."0.0.3" =
    self.by-version."pgpass"."0.0.3";
  by-version."pgpass"."0.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "pgpass-0.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/pgpass/-/pgpass-0.0.3.tgz";
        name = "pgpass-0.0.3.tgz";
        sha1 = "12e67e343b3189c2f31206ebc9cc0befffcf9140";
      })
    ];
    buildInputs =
      (self.nativeDeps."pgpass" or []);
    deps = {
      "split-0.3.0" = self.by-version."split"."0.3.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "pgpass" ];
  };
  by-spec."pkginfo"."0.2.x" =
    self.by-version."pkginfo"."0.2.3";
  by-version."pkginfo"."0.2.3" = lib.makeOverridable self.buildNodePackage {
    name = "pkginfo-0.2.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/pkginfo/-/pkginfo-0.2.3.tgz";
        name = "pkginfo-0.2.3.tgz";
        sha1 = "7239c42a5ef6c30b8f328439d9b9ff71042490f8";
      })
    ];
    buildInputs =
      (self.nativeDeps."pkginfo" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "pkginfo" ];
  };
  by-spec."pkginfo"."0.3.0" =
    self.by-version."pkginfo"."0.3.0";
  by-version."pkginfo"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "pkginfo-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/pkginfo/-/pkginfo-0.3.0.tgz";
        name = "pkginfo-0.3.0.tgz";
        sha1 = "726411401039fe9b009eea86614295d5f3a54276";
      })
    ];
    buildInputs =
      (self.nativeDeps."pkginfo" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "pkginfo" ];
  };
  by-spec."pkginfo"."0.3.x" =
    self.by-version."pkginfo"."0.3.0";
  by-spec."pkginfo"."0.x.x" =
    self.by-version."pkginfo"."0.3.0";
  by-spec."prompt"."0.2.11" =
    self.by-version."prompt"."0.2.11";
  by-version."prompt"."0.2.11" = lib.makeOverridable self.buildNodePackage {
    name = "prompt-0.2.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/prompt/-/prompt-0.2.11.tgz";
        name = "prompt-0.2.11.tgz";
        sha1 = "26d455af4b7fac15291dfcdddf2400328c1fa446";
      })
    ];
    buildInputs =
      (self.nativeDeps."prompt" or []);
    deps = {
      "pkginfo-0.3.0" = self.by-version."pkginfo"."0.3.0";
      "read-1.0.5" = self.by-version."read"."1.0.5";
      "revalidator-0.1.8" = self.by-version."revalidator"."0.1.8";
      "utile-0.2.1" = self.by-version."utile"."0.2.1";
      "winston-0.6.2" = self.by-version."winston"."0.6.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "prompt" ];
  };
  by-spec."proxy-addr"."~1.0.3" =
    self.by-version."proxy-addr"."1.0.3";
  by-version."proxy-addr"."1.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "proxy-addr-1.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/proxy-addr/-/proxy-addr-1.0.3.tgz";
        name = "proxy-addr-1.0.3.tgz";
        sha1 = "17d824aac844707441249da6d1ea5e889007cdd6";
      })
    ];
    buildInputs =
      (self.nativeDeps."proxy-addr" or []);
    deps = {
      "forwarded-0.1.0" = self.by-version."forwarded"."0.1.0";
      "ipaddr.js-0.1.3" = self.by-version."ipaddr.js"."0.1.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "proxy-addr" ];
  };
  by-spec."ps-tree"."0.0.x" =
    self.by-version."ps-tree"."0.0.3";
  by-version."ps-tree"."0.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "ps-tree-0.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ps-tree/-/ps-tree-0.0.3.tgz";
        name = "ps-tree-0.0.3.tgz";
        sha1 = "dbf8d752a7fe22fa7d58635689499610e9276ddc";
      })
    ];
    buildInputs =
      (self.nativeDeps."ps-tree" or []);
    deps = {
      "event-stream-0.5.3" = self.by-version."event-stream"."0.5.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "ps-tree" ];
  };
  by-spec."qs"."2.2.4" =
    self.by-version."qs"."2.2.4";
  by-version."qs"."2.2.4" = lib.makeOverridable self.buildNodePackage {
    name = "qs-2.2.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/qs/-/qs-2.2.4.tgz";
        name = "qs-2.2.4.tgz";
        sha1 = "2e9fbcd34b540e3421c924ecd01e90aa975319c8";
      })
    ];
    buildInputs =
      (self.nativeDeps."qs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "qs" ];
  };
  by-spec."qs"."~0.5.4" =
    self.by-version."qs"."0.5.6";
  by-version."qs"."0.5.6" = lib.makeOverridable self.buildNodePackage {
    name = "qs-0.5.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/qs/-/qs-0.5.6.tgz";
        name = "qs-0.5.6.tgz";
        sha1 = "31b1ad058567651c526921506b9a8793911a0384";
      })
    ];
    buildInputs =
      (self.nativeDeps."qs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "qs" ];
  };
  by-spec."range-parser"."~1.0.2" =
    self.by-version."range-parser"."1.0.2";
  by-version."range-parser"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "range-parser-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/range-parser/-/range-parser-1.0.2.tgz";
        name = "range-parser-1.0.2.tgz";
        sha1 = "06a12a42e5131ba8e457cd892044867f2344e549";
      })
    ];
    buildInputs =
      (self.nativeDeps."range-parser" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "range-parser" ];
  };
  by-spec."read"."1.0.x" =
    self.by-version."read"."1.0.5";
  by-version."read"."1.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "read-1.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/read/-/read-1.0.5.tgz";
        name = "read-1.0.5.tgz";
        sha1 = "007a3d169478aa710a491727e453effb92e76203";
      })
    ];
    buildInputs =
      (self.nativeDeps."read" or []);
    deps = {
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "read" ];
  };
  by-spec."request"."2.16.x" =
    self.by-version."request"."2.16.6";
  by-version."request"."2.16.6" = lib.makeOverridable self.buildNodePackage {
    name = "request-2.16.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request/-/request-2.16.6.tgz";
        name = "request-2.16.6.tgz";
        sha1 = "872fe445ae72de266b37879d6ad7dc948fa01cad";
      })
    ];
    buildInputs =
      (self.nativeDeps."request" or []);
    deps = {
      "form-data-0.0.10" = self.by-version."form-data"."0.0.10";
      "mime-1.2.11" = self.by-version."mime"."1.2.11";
      "hawk-0.10.2" = self.by-version."hawk"."0.10.2";
      "node-uuid-1.4.1" = self.by-version."node-uuid"."1.4.1";
      "cookie-jar-0.2.0" = self.by-version."cookie-jar"."0.2.0";
      "aws-sign-0.2.0" = self.by-version."aws-sign"."0.2.0";
      "oauth-sign-0.2.0" = self.by-version."oauth-sign"."0.2.0";
      "forever-agent-0.2.0" = self.by-version."forever-agent"."0.2.0";
      "tunnel-agent-0.2.0" = self.by-version."tunnel-agent"."0.2.0";
      "json-stringify-safe-3.0.0" = self.by-version."json-stringify-safe"."3.0.0";
      "qs-0.5.6" = self.by-version."qs"."0.5.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request" ];
  };
  by-spec."request"."2.9.x" =
    self.by-version."request"."2.9.203";
  by-version."request"."2.9.203" = lib.makeOverridable self.buildNodePackage {
    name = "request-2.9.203";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request/-/request-2.9.203.tgz";
        name = "request-2.9.203.tgz";
        sha1 = "6c1711a5407fb94a114219563e44145bcbf4723a";
      })
    ];
    buildInputs =
      (self.nativeDeps."request" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "request" ];
  };
  by-spec."revalidator"."0.1.x" =
    self.by-version."revalidator"."0.1.8";
  by-version."revalidator"."0.1.8" = lib.makeOverridable self.buildNodePackage {
    name = "revalidator-0.1.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/revalidator/-/revalidator-0.1.8.tgz";
        name = "revalidator-0.1.8.tgz";
        sha1 = "fece61bfa0c1b52a206bd6b18198184bdd523a3b";
      })
    ];
    buildInputs =
      (self.nativeDeps."revalidator" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "revalidator" ];
  };
  by-spec."rimraf"."1.x.x" =
    self.by-version."rimraf"."1.0.9";
  by-version."rimraf"."1.0.9" = lib.makeOverridable self.buildNodePackage {
    name = "rimraf-1.0.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rimraf/-/rimraf-1.0.9.tgz";
        name = "rimraf-1.0.9.tgz";
        sha1 = "be4801ff76c2ba6f1c50c78e9700eb1d21f239f1";
      })
    ];
    buildInputs =
      (self.nativeDeps."rimraf" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "rimraf" ];
  };
  by-spec."rimraf"."2.x.x" =
    self.by-version."rimraf"."2.2.8";
  by-version."rimraf"."2.2.8" = lib.makeOverridable self.buildNodePackage {
    name = "rimraf-2.2.8";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rimraf/-/rimraf-2.2.8.tgz";
        name = "rimraf-2.2.8.tgz";
        sha1 = "e439be2aaee327321952730f99a8929e4fc50582";
      })
    ];
    buildInputs =
      (self.nativeDeps."rimraf" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "rimraf" ];
  };
  by-spec."send"."0.9.3" =
    self.by-version."send"."0.9.3";
  by-version."send"."0.9.3" = lib.makeOverridable self.buildNodePackage {
    name = "send-0.9.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/send/-/send-0.9.3.tgz";
        name = "send-0.9.3.tgz";
        sha1 = "b43a7414cd089b7fbec9b755246f7c37b7b85cc0";
      })
    ];
    buildInputs =
      (self.nativeDeps."send" or []);
    deps = {
      "debug-2.0.0" = self.by-version."debug"."2.0.0";
      "depd-0.4.5" = self.by-version."depd"."0.4.5";
      "destroy-1.0.3" = self.by-version."destroy"."1.0.3";
      "escape-html-1.0.1" = self.by-version."escape-html"."1.0.1";
      "etag-1.4.0" = self.by-version."etag"."1.4.0";
      "fresh-0.2.4" = self.by-version."fresh"."0.2.4";
      "mime-1.2.11" = self.by-version."mime"."1.2.11";
      "ms-0.6.2" = self.by-version."ms"."0.6.2";
      "on-finished-2.1.0" = self.by-version."on-finished"."2.1.0";
      "range-parser-1.0.2" = self.by-version."range-parser"."1.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "send" ];
  };
  by-spec."serve-static"."~1.6.3" =
    self.by-version."serve-static"."1.6.4";
  by-version."serve-static"."1.6.4" = lib.makeOverridable self.buildNodePackage {
    name = "serve-static-1.6.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/serve-static/-/serve-static-1.6.4.tgz";
        name = "serve-static-1.6.4.tgz";
        sha1 = "c512e4188d7a9366672db24e40d294f0c6212367";
      })
    ];
    buildInputs =
      (self.nativeDeps."serve-static" or []);
    deps = {
      "escape-html-1.0.1" = self.by-version."escape-html"."1.0.1";
      "parseurl-1.3.0" = self.by-version."parseurl"."1.3.0";
      "send-0.9.3" = self.by-version."send"."0.9.3";
      "utils-merge-1.0.0" = self.by-version."utils-merge"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "serve-static" ];
  };
  by-spec."sigmund"."~1.0.0" =
    self.by-version."sigmund"."1.0.0";
  by-version."sigmund"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "sigmund-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sigmund/-/sigmund-1.0.0.tgz";
        name = "sigmund-1.0.0.tgz";
        sha1 = "66a2b3a749ae8b5fb89efd4fcc01dc94fbe02296";
      })
    ];
    buildInputs =
      (self.nativeDeps."sigmund" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "sigmund" ];
  };
  by-spec."sntp"."0.1.x" =
    self.by-version."sntp"."0.1.4";
  by-version."sntp"."0.1.4" = lib.makeOverridable self.buildNodePackage {
    name = "sntp-0.1.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sntp/-/sntp-0.1.4.tgz";
        name = "sntp-0.1.4.tgz";
        sha1 = "5ef481b951a7b29affdf4afd7f26838fc1120f84";
      })
    ];
    buildInputs =
      (self.nativeDeps."sntp" or []);
    deps = {
      "hoek-0.7.6" = self.by-version."hoek"."0.7.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "sntp" ];
  };
  by-spec."split"."~0.3" =
    self.by-version."split"."0.3.0";
  by-version."split"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "split-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/split/-/split-0.3.0.tgz";
        name = "split-0.3.0.tgz";
        sha1 = "02958c9fb7adb35907ac7068629aa28c91814f1b";
      })
    ];
    buildInputs =
      (self.nativeDeps."split" or []);
    deps = {
      "through-2.3.6" = self.by-version."through"."2.3.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "split" ];
  };
  by-spec."stack-trace"."0.0.x" =
    self.by-version."stack-trace"."0.0.9";
  by-version."stack-trace"."0.0.9" = lib.makeOverridable self.buildNodePackage {
    name = "stack-trace-0.0.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/stack-trace/-/stack-trace-0.0.9.tgz";
        name = "stack-trace-0.0.9.tgz";
        sha1 = "a8f6eaeca90674c333e7c43953f275b451510695";
      })
    ];
    buildInputs =
      (self.nativeDeps."stack-trace" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "stack-trace" ];
  };
  by-spec."through"."2" =
    self.by-version."through"."2.3.6";
  by-version."through"."2.3.6" = lib.makeOverridable self.buildNodePackage {
    name = "through-2.3.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/through/-/through-2.3.6.tgz";
        name = "through-2.3.6.tgz";
        sha1 = "26681c0f524671021d4e29df7c36bce2d0ecf2e8";
      })
    ];
    buildInputs =
      (self.nativeDeps."through" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "through" ];
  };
  by-spec."timespan"."~2.3.0" =
    self.by-version."timespan"."2.3.0";
  by-version."timespan"."2.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "timespan-2.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/timespan/-/timespan-2.3.0.tgz";
        name = "timespan-2.3.0.tgz";
        sha1 = "4902ce040bd13d845c8f59b27e9d59bad6f39929";
      })
    ];
    buildInputs =
      (self.nativeDeps."timespan" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "timespan" ];
  };
  by-spec."tunnel-agent"."~0.2.0" =
    self.by-version."tunnel-agent"."0.2.0";
  by-version."tunnel-agent"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "tunnel-agent-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.2.0.tgz";
        name = "tunnel-agent-0.2.0.tgz";
        sha1 = "6853c2afb1b2109e45629e492bde35f459ea69e8";
      })
    ];
    buildInputs =
      (self.nativeDeps."tunnel-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "tunnel-agent" ];
  };
  by-spec."type-is"."~1.5.1" =
    self.by-version."type-is"."1.5.2";
  by-version."type-is"."1.5.2" = lib.makeOverridable self.buildNodePackage {
    name = "type-is-1.5.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/type-is/-/type-is-1.5.2.tgz";
        name = "type-is-1.5.2.tgz";
        sha1 = "8291bbe845a904acfaffd05a41fdeb234bfa9e5f";
      })
    ];
    buildInputs =
      (self.nativeDeps."type-is" or []);
    deps = {
      "media-typer-0.3.0" = self.by-version."media-typer"."0.3.0";
      "mime-types-2.0.2" = self.by-version."mime-types"."2.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "type-is" ];
  };
  by-spec."utile"."0.1.x" =
    self.by-version."utile"."0.1.7";
  by-version."utile"."0.1.7" = lib.makeOverridable self.buildNodePackage {
    name = "utile-0.1.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/utile/-/utile-0.1.7.tgz";
        name = "utile-0.1.7.tgz";
        sha1 = "55db180d54475339fd6dd9e2d14a4c0b52624b69";
      })
    ];
    buildInputs =
      (self.nativeDeps."utile" or []);
    deps = {
      "async-0.1.22" = self.by-version."async"."0.1.22";
      "deep-equal-0.2.1" = self.by-version."deep-equal"."0.2.1";
      "i-0.3.2" = self.by-version."i"."0.3.2";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "ncp-0.2.7" = self.by-version."ncp"."0.2.7";
      "rimraf-1.0.9" = self.by-version."rimraf"."1.0.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "utile" ];
  };
  by-spec."utile"."0.2.1" =
    self.by-version."utile"."0.2.1";
  by-version."utile"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "utile-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/utile/-/utile-0.2.1.tgz";
        name = "utile-0.2.1.tgz";
        sha1 = "930c88e99098d6220834c356cbd9a770522d90d7";
      })
    ];
    buildInputs =
      (self.nativeDeps."utile" or []);
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "deep-equal-0.2.1" = self.by-version."deep-equal"."0.2.1";
      "i-0.3.2" = self.by-version."i"."0.3.2";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "ncp-0.4.2" = self.by-version."ncp"."0.4.2";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "utile" ];
  };
  by-spec."utile"."0.2.x" =
    self.by-version."utile"."0.2.1";
  by-spec."utile"."~0.2.1" =
    self.by-version."utile"."0.2.1";
  by-spec."utils-merge"."1.0.0" =
    self.by-version."utils-merge"."1.0.0";
  by-version."utils-merge"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "utils-merge-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/utils-merge/-/utils-merge-1.0.0.tgz";
        name = "utils-merge-1.0.0.tgz";
        sha1 = "0294fb922bb9375153541c4f7096231f287c8af8";
      })
    ];
    buildInputs =
      (self.nativeDeps."utils-merge" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "utils-merge" ];
  };
  by-spec."vary"."~1.0.0" =
    self.by-version."vary"."1.0.0";
  by-version."vary"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "vary-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/vary/-/vary-1.0.0.tgz";
        name = "vary-1.0.0.tgz";
        sha1 = "c5e76cec20d3820d8f2a96e7bee38731c34da1e7";
      })
    ];
    buildInputs =
      (self.nativeDeps."vary" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "vary" ];
  };
  by-spec."watch"."0.5.x" =
    self.by-version."watch"."0.5.1";
  by-version."watch"."0.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "watch-0.5.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/watch/-/watch-0.5.1.tgz";
        name = "watch-0.5.1.tgz";
        sha1 = "50ea3a056358c98073e0bca59956de4afd20b213";
      })
    ];
    buildInputs =
      (self.nativeDeps."watch" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "watch" ];
  };
  by-spec."watch"."~0.8.0" =
    self.by-version."watch"."0.8.0";
  by-version."watch"."0.8.0" = lib.makeOverridable self.buildNodePackage {
    name = "watch-0.8.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/watch/-/watch-0.8.0.tgz";
        name = "watch-0.8.0.tgz";
        sha1 = "1bb0eea53defe6e621e9c8c63c0358007ecbdbcc";
      })
    ];
    buildInputs =
      (self.nativeDeps."watch" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "watch" ];
  };
  by-spec."winston"."0.6.x" =
    self.by-version."winston"."0.6.2";
  by-version."winston"."0.6.2" = lib.makeOverridable self.buildNodePackage {
    name = "winston-0.6.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/winston/-/winston-0.6.2.tgz";
        name = "winston-0.6.2.tgz";
        sha1 = "4144fe2586cdc19a612bf8c035590132c9064bd2";
      })
    ];
    buildInputs =
      (self.nativeDeps."winston" or []);
    deps = {
      "async-0.1.22" = self.by-version."async"."0.1.22";
      "colors-0.6.2" = self.by-version."colors"."0.6.2";
      "cycle-1.0.3" = self.by-version."cycle"."1.0.3";
      "eyes-0.1.8" = self.by-version."eyes"."0.1.8";
      "pkginfo-0.2.3" = self.by-version."pkginfo"."0.2.3";
      "request-2.9.203" = self.by-version."request"."2.9.203";
      "stack-trace-0.0.9" = self.by-version."stack-trace"."0.0.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "winston" ];
  };
  by-spec."winston"."0.7.2" =
    self.by-version."winston"."0.7.2";
  by-version."winston"."0.7.2" = lib.makeOverridable self.buildNodePackage {
    name = "winston-0.7.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/winston/-/winston-0.7.2.tgz";
        name = "winston-0.7.2.tgz";
        sha1 = "2570ae1aa1d8a9401e8d5a88362e1cf936550ceb";
      })
    ];
    buildInputs =
      (self.nativeDeps."winston" or []);
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "colors-0.6.2" = self.by-version."colors"."0.6.2";
      "cycle-1.0.3" = self.by-version."cycle"."1.0.3";
      "eyes-0.1.8" = self.by-version."eyes"."0.1.8";
      "pkginfo-0.3.0" = self.by-version."pkginfo"."0.3.0";
      "request-2.16.6" = self.by-version."request"."2.16.6";
      "stack-trace-0.0.9" = self.by-version."stack-trace"."0.0.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "winston" ];
  };
  by-spec."winston"."~0.7.2" =
    self.by-version."winston"."0.7.3";
  by-version."winston"."0.7.3" = lib.makeOverridable self.buildNodePackage {
    name = "winston-0.7.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/winston/-/winston-0.7.3.tgz";
        name = "winston-0.7.3.tgz";
        sha1 = "7ae313ba73fcdc2ecb4aa2f9cd446e8298677266";
      })
    ];
    buildInputs =
      (self.nativeDeps."winston" or []);
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "colors-0.6.2" = self.by-version."colors"."0.6.2";
      "cycle-1.0.3" = self.by-version."cycle"."1.0.3";
      "eyes-0.1.8" = self.by-version."eyes"."0.1.8";
      "pkginfo-0.3.0" = self.by-version."pkginfo"."0.3.0";
      "request-2.16.6" = self.by-version."request"."2.16.6";
      "stack-trace-0.0.9" = self.by-version."stack-trace"."0.0.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "winston" ];
  };
  by-spec."wordwrap".">=0.0.1 <0.1.0" =
    self.by-version."wordwrap"."0.0.2";
  by-version."wordwrap"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "wordwrap-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/wordwrap/-/wordwrap-0.0.2.tgz";
        name = "wordwrap-0.0.2.tgz";
        sha1 = "b79669bb42ecb409f83d583cad52ca17eaa1643f";
      })
    ];
    buildInputs =
      (self.nativeDeps."wordwrap" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "wordwrap" ];
  };
  by-spec."wordwrap"."~0.0.2" =
    self.by-version."wordwrap"."0.0.2";
}
