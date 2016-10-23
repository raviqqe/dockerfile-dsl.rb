# dockerfile-dsl

[![Build Status](https://travis-ci.org/raviqqe/dockerfile-dsl.svg?branch=master)](https://travis-ci.org/raviqqe/dockerfile-dsl)
[![License](https://img.shields.io/badge/license-unlicense-lightgray.svg)](https://unlicense.org)

Block is Hash

## Installation

```
$ gem install dockerfile-dsl
```

## Usage

Code:

```ruby
require 'dockerfile-dsl'

file = dockerfile do
  from :ubuntu
  run 'sudo apt install nginx'
  add 'nginx.conf', '/etc/nginx.conf'
  cmd [:service, :nginx, :start]
end

puts file
```

Output:

```dockerfile
FROM ubuntu
RUN sudo apt install nginx
ADD nginx.conf /etc/nginx.conf
CMD ["service", "nginx", "start"]
```

For more examples, see [examples](examples) directory.

## License

[The Unlicense](https://unlicense.org)
