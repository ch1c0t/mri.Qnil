#include "ruby.h"

typedef unsigned long VALUE; // otherwise, cast cannot parse
static VALUE foo = Qnil;

int
without_foo()
{
  return 0;
}

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
