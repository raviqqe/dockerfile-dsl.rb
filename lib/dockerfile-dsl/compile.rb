def compile array
  array.map do |entry|
    entry.to_s.upcase + entry[1..-1].map { |o| compile_object o } + "\n"
  end.join
end

def compile_object object
  case object
  when Array
    '[' + object.map{ |o| o.to_s.dump }.join(', ') + ']'
  when String, Symbol
    object.to_s
  else
    raise "Invalid object is detected.: #{o}"
  end
end
