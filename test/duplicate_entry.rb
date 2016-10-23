require 'dockerfile-dsl'

dockerfile %i(foo) do
  foo 123
  foo 123
end
