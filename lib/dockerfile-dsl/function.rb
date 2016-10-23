require 'block-is-array'

require_relative 'compile'



def dockerfile &block
  compile block_is_array(&block)
end
