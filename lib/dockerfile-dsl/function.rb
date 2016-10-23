require 'block-is-array'

require_relative 'compile'



def dockerfile &block
  Dockerfile::from_array block_is_array(&block)
end
