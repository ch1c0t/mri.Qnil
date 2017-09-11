require 'cast'

path_to_file = ARGV[0]
code = IO.read path_to_file

ast = C.parse code.lines[1..-1].join
functions = ast.entities.grep C::FunctionDef

require 'pry'
binding.pry
puts ast
