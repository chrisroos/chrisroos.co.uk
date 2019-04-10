---
title: Testing Method Responses - Full
date:       2006-09-18 21:45:42 +01:00
layout: blog
---
<pre class="code ruby">
class Foo
  def foo; end; public :foo
  def bar; end; protected :bar
  def baz; end; private :baz
end

require 'test/unit'

IncludePrivate = true
IncludeSuper = true

FooMethod = :foo.to_s
BarMethod = :bar.to_s
BazMethod = :baz.to_s

class Test::Unit::TestCase
  def assert_not(expr, msg = '')
    assert ! expr, msg
  end
end

%%
Module
------
instance_methods(include_super=true)
instance_method
method_defined?
private_instance_methods(include_super=true)
private_method_defined?
protected_instance_methods(include_super=true)
protected_method_defined?
public_instance_methods(include_super=true)
public_method_defined?
%

# Testing a Class.  Module methods. (CM)
Class.new(Test::Unit::TestCase) do

  def test_CM_instance_methods
    assert Foo.instance_methods.include?(FooMethod)
    assert Foo.instance_methods.include?(BarMethod)
    assert_not Foo.instance_methods.include?(BazMethod)
  end

  def test_CM_instance_method
    assert_not_nil Foo.instance_method(FooMethod)
    assert_not_nil Foo.instance_method(BarMethod)
    assert_not_nil Foo.instance_method(BazMethod)
  end

  def test_CM_method_defined?
    assert Foo.method_defined?(FooMethod)
    assert Foo.method_defined?(BarMethod)
    assert_not Foo.method_defined?(BazMethod)
  end

  def test_CM_public_instance_methods
    assert Foo.public_instance_methods.include?('foo')
    assert_not Foo.public_instance_methods.include?('bar')
    assert_not Foo.public_instance_methods.include?('baz')
    assert Foo.public_instance_methods(IncludeSuper).include?('foo')
    assert_not Foo.public_instance_methods(IncludeSuper).include?('bar')
    assert_not Foo.public_instance_methods(IncludeSuper).include?('baz')
  end

  def test_CM_protected_instance_methods
    assert_not Foo.protected_instance_methods.include?('foo')
    assert Foo.protected_instance_methods.include?('bar')
    assert_not Foo.protected_instance_methods.include?('baz')
    assert_not Foo.protected_instance_methods(IncludeSuper).include?('foo')
    assert Foo.protected_instance_methods(IncludeSuper).include?('bar')
    assert_not Foo.protected_instance_methods(IncludeSuper).include?('baz')
  end

  def test_CM_private_instance_methods
    assert_not Foo.private_instance_methods.include?('foo')
    assert_not Foo.private_instance_methods.include?('bar')
    assert Foo.private_instance_methods.include?('baz')
    assert_not Foo.private_instance_methods(IncludeSuper).include?('foo')
    assert_not Foo.private_instance_methods(IncludeSuper).include?('bar')
    assert Foo.private_instance_methods(IncludeSuper).include?('baz')
  end

  def test_CM_public_method_defined?
    assert Foo.public_method_defined?(FooMethod)
    assert_not Foo.public_method_defined?(BarMethod)
    assert_not Foo.public_method_defined?(BazMethod)
  end

  def test_CM_protected_method_defined?
    assert_not Foo.protected_method_defined?(FooMethod)
    assert Foo.protected_method_defined?(BarMethod)
    assert_not Foo.protected_method_defined?(BazMethod)
  end

  def test_CM_private_method_defined?
    assert_not Foo.private_method_defined?(FooMethod)
    assert_not Foo.private_method_defined?(BarMethod)
    assert Foo.private_method_defined?(BazMethod)
  end

end

# # Testing on instance.  Module methods. (IM)
# Class.new(Test::Unit::TestCase) do
#
#   def setup
#     @foo = Foo.new
#   end
#
#   def test_IM_private_instance_methods
#     assert_not @foo.private_instance_methods.include?(FooMethod)
#     assert_not @foo.private_instance_methods.include?(BarMethod)
#     assert_not @foo.private_instance_methods.include?(BazMethod)
#     assert_not @foo.private_instance_methods(true).include?(FooMethod)
#     assert_not @foo.private_instance_methods(true).include?(BarMethod)
#     assert_not @foo.private_instance_methods(true).include?(BazMethod)
#   end
#
#   def test_IM_protected_instance_methods
#     assert_not @foo.protected_instance_methods.include?(FooMethod)
#     assert_not @foo.protected_instance_methods.include?(BarMethod)
#     assert_not @foo.protected_instance_methods.include?(BazMethod)
#     assert_not @foo.protected_instance_methods(true).include?(FooMethod)
#     assert_not @foo.protected_instance_methods(true).include?(BarMethod)
#     assert_not @foo.protected_instance_methods(true).include?(BazMethod)
#   end
#
#   def test_IM_public_instance_methods
#     assert_not @foo.public_instance_methods.include?(FooMethod)
#     assert_not @foo.public_instance_methods.include?(BarMethod)
#     assert_not @foo.public_instance_methods.include?(BazMethod)
#     assert_not @foo.public_instance_methods(true).include?(FooMethod)
#     assert_not @foo.public_instance_methods(true).include?(BarMethod)
#     assert_not @foo.public_instance_methods(true).include?(BazMethod)
#   end
#
#   def test_IM_instance_method
#     assert_not_nil @foo.instance_method(FooMethod)
#     assert_not_nil @foo.instance_method(BarMethod)
#     assert_not_nil @foo.instance_method(BazMethod)
#   end
#
#   def test_IM_method_defined?
#     assert @foo.method_defined?(FooMethod)
#     assert @foo.method_defined?(BarMethod)
#     assert_not @foo.method_defined?(BazMethod)
#   end
#
#   def test_IM_private_method_defined?
#     assert_not @foo.private_method_defined?(FooMethod)
#     assert_not @foo.private_method_defined?(BarMethod)
#     assert @foo.private_method_defined?(BazMethod)
#   end
#
#   def test_IM_protected_method_defined?
#     assert_not @foo.protected_method_defined?(FooMethod)
#     assert @foo.protected_method_defined?(BarMethod)
#     assert_not @foo.protected_method_defined?(BazMethod)
#   end
#
#   def test_IM_public_method_defined?
#     assert @foo.public_method_defined?(FooMethod)
#     assert_not @foo.public_method_defined?(BarMethod)
#     assert_not @foo.public_method_defined?(BazMethod)
#   end
#
# end

%%
Object
------
method
methods
private_methods
protected_methods
public_methods
respond_to?(sym, include_private=false)
%

# Testing a class.  Object methods. (KO)
Class.new(Test::Unit::TestCase) do

  def test_KO_method
    assert_raise(NameError) { Foo.method(FooMethod) }
    assert_raise(NameError) { Foo.method(BarMethod) }
    assert_raise(NameError) { Foo.method(BazMethod) }
  end

  def test_KO_methods
    assert_not Foo.methods.include?(FooMethod)
    assert_not Foo.methods.include?(BarMethod)
    assert_not Foo.methods.include?(BazMethod)
  end

  def test_KO_private_methods
     assert_not Foo.private_methods.include?(FooMethod)
     assert_not Foo.private_methods.include?(BarMethod)
     assert_not Foo.private_methods.include?(BazMethod)
     assert_not Foo.private_methods(IncludeSuper).include?(FooMethod)
     assert_not Foo.private_methods(IncludeSuper).include?(BarMethod)
     assert_not Foo.private_methods(IncludeSuper).include?(BazMethod)
  end

  def test_KO_protected_methods
     assert_not Foo.protected_methods.include?(FooMethod)
     assert_not Foo.protected_methods.include?(BarMethod)
     assert_not Foo.protected_methods.include?(BazMethod)
     assert_not Foo.protected_methods(IncludeSuper).include?(FooMethod)
     assert_not Foo.protected_methods(IncludeSuper).include?(BarMethod)
     assert_not Foo.protected_methods(IncludeSuper).include?(BazMethod)
  end

  def test_KO_public_methods
     assert_not Foo.public_methods.include?(FooMethod)
     assert_not Foo.public_methods.include?(BarMethod)
     assert_not Foo.public_methods.include?(BazMethod)
     assert_not Foo.public_methods(IncludeSuper).include?(FooMethod)
     assert_not Foo.public_methods(IncludeSuper).include?(BarMethod)
     assert_not Foo.public_methods(IncludeSuper).include?(BazMethod)
  end

  def test_KO_respond_to?
    assert_not Foo.respond_to?(FooMethod)
    assert_not Foo.respond_to?(BarMethod)
    assert_not Foo.respond_to?(BazMethod)
    assert_not Foo.respond_to?(FooMethod, IncludePrivate)
    assert_not Foo.respond_to?(BarMethod, IncludePrivate)
    assert_not Foo.respond_to?(BazMethod, IncludePrivate)
  end

end

# Testing an instance.  Object methods. (IO)
Class.new(Test::Unit::TestCase) do

  def setup
    @foo = Foo.new
  end

  def test_IO_method
    assert_not_nil @foo.method(FooMethod)
    assert_not_nil @foo.method(BarMethod)
    assert_not_nil @foo.method(BazMethod)
  end

  def test_IO_methods
    assert @foo.methods.include?(FooMethod)
    assert @foo.methods.include?(BarMethod)
    assert_not @foo.methods.include?(BazMethod)
  end

  def test_IO_private_methods
     assert_not @foo.private_methods.include?(FooMethod)
     assert_not @foo.private_methods.include?(BarMethod)
     assert @foo.private_methods.include?(BazMethod)
     assert_not @foo.private_methods(IncludeSuper).include?(FooMethod)
     assert_not @foo.private_methods(IncludeSuper).include?(BarMethod)
     assert @foo.private_methods(IncludeSuper).include?(BazMethod)
  end

  def test_IO_protected_methods
     assert_not @foo.protected_methods.include?(FooMethod)
     assert @foo.protected_methods.include?(BarMethod)
     assert_not @foo.protected_methods.include?(BazMethod)
     assert_not @foo.protected_methods(IncludeSuper).include?(FooMethod)
     assert @foo.protected_methods(IncludeSuper).include?(BarMethod)
     assert_not @foo.protected_methods(IncludeSuper).include?(BazMethod)
  end

  def test_IO_public_methods
     assert @foo.public_methods.include?(FooMethod)
     assert_not @foo.public_methods.include?(BarMethod)
     assert_not @foo.public_methods.include?(BazMethod)
     assert @foo.public_methods(IncludeSuper).include?(FooMethod)
     assert_not @foo.public_methods(IncludeSuper).include?(BarMethod)
     assert_not @foo.public_methods(IncludeSuper).include?(BazMethod)
  end

  def test_IO_respond_to?
    assert @foo.respond_to?(FooMethod)
    assert @foo.respond_to?(BarMethod)
    assert_not @foo.respond_to?(BazMethod)
    assert @foo.respond_to?(FooMethod, IncludePrivate)
    assert @foo.respond_to?(BarMethod, IncludePrivate)
    assert @foo.respond_to?(BazMethod, IncludePrivate)
  end

end
</pre>
