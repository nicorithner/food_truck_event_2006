require "./test/test_helper"

class FoodTruckTest < Minitest::Test 

  def test_it_exists
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    
    assert_instance_of FoodTruck, food_truck
  end
  
  def test_it_has_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_equal "Rocky Mountain Pies", food_truck.name
    expected = {}
    assert_equal expected, food_truck.inventory
  end
end