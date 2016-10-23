#!/usr/bin/env ruby

require 'dockerfile-dsl'



file = dockerfile do
  from :ubuntu
  run 'sudo apt install nginx'
  add 'nginx.conf', '/etc/nginx.conf'
  cmd 'service nginx start'
end

puts file
