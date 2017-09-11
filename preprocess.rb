require 'cast'

path_to_file = ARGV[0]
code = IO.read path_to_file

ast = C.parse code.lines[1..-1].join
functions = ast.entities.grep C::FunctionDef
lf = functions.last

lf.type.class #=> C::Function < C::IndirectType
lf.def.class  #=> C::Block < C::Statement

lf.def.smtms #=> C::NodeChain < C::NodeList
lf.def.smtms.size #=> 2

lf.def.stmts.first.class #=> C::Declaration < C::Node
# VALUE Hello = rb_define_module("Hello");

lf.def.stmts.last.class #=> C::ExpressionStatement < C::Statement
# rb_define_singleton_method(Hello, "world", just_return_nil, 0);

require 'pry'
binding.pry
puts ast
