require 'cast'

path_to_file = ARGV[0]
code = IO.read path_to_file

def preprocess code
  cpp = C::Preprocessor.new 
  cpp.include_path << '/usr/include' << '/usr/include/ruby-2.4.0' << '/usr/include/ruby-2.4.0/x86_64-linux'
  code = cpp.preprocess code
end

def delete_gnu_cpp_linemarkers code
  code.lines.reject do |line|
    line.start_with? '#'
  end.join
end

ast = C.parse delete_gnu_cpp_linemarkers preprocess code
require 'pry'
binding.pry
ast
