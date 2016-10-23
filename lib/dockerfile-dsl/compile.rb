def compile array
  array.map do |entry|
    [entry[0].to_s.upcase, *entry[1..-1].map { |o| compile_object o }] \
        .join(' ') + "\n"
  end.join
end

def compile_object object
  case object
  when Array
    '[' + object.map{ |o| o.to_s.dump }.join(', ') + ']'
  when -> (o) { o.respond_to? :to_s }
    object.to_s
  else
    raise "Invalid object is detected.: #{object}"
  end
end
