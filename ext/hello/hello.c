#include "ruby.h"

static VALUE foo = Qnil;

VALUE
just_return_nil()
{
  return foo;
}

void
Init_hello()
{
  VALUE Hello = rb_define_module("Hello");
  rb_define_singleton_method(Hello, "world", just_return_nil, 0);
}
