require "./test/test_helper"

class MyClassTest < Minitest::Test 

  def test_it_exists
    my_class = MyClass.new
    
    assert_instance_of MyClass, my_class
  end
  
  def test_it_has_attributes
    my_class = MyClass.new

    assert_equal ["something"], my_class.some_method
  end
end