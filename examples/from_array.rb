#!/usr/bin/env ruby

require 'block-is-array'
require 'dockerfile-dsl'



array = block_is_array do
  from 'ubuntu'
  expose 21, 22, 80, 443
  cmd ['/bin/sh']
end

array.insert 1, [:maintainer, 'Me']

puts Dockerfile.from_array(array)
