require_relative 'blockishash'



def dockerfile repeats, &block
  BlockIsHash.new(repeats, &block).to_hash
end
