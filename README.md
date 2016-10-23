# dockerfile-dsl

[![Build Status](https://travis-ci.org/raviqqe/dockerfile-dsl.svg?branch=master)](https://travis-ci.org/raviqqe/dockerfile-dsl)
[![License](https://img.shields.io/badge/license-unlicense-lightgray.svg)](https://unlicense.org)

Block is Hash

## Installation

```
$ gem install dockerfile-dsl
```

## Usage

```
require 'dockerfile-dsl'

hash = block_is_hash %i(server) do
  user :www

  http do
    server do
      listen 80
      server_name 'foo.com'
    end

    server do
      listen 443, :ssl
      server_name 'bar.com'
    end
  end
end

p hash
```

For more examples, see [examples](examples) directory.

## License

[The Unlicense](https://unlicense.org)
