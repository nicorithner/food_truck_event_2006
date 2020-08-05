require "./test/test_helper"

class EventTest < Minitest::Test 

  def test_it_exists_and_has_attributes
    event = Event.new("South Pearl Street Farmers Market") 

    assert_instance_of Event , event
    assert_equal  "South Pearl Street Farmers Market", event.name
    assert_equal  [], event.food_trucks
  end

  def test_it_has_food_trucks
    event = Event.new("South Pearl Street Farmers Market") 
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    food_truck1.stock(item1, 35)    
    food_truck1.stock(item2, 7)    

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

    food_truck2.stock(item4, 50)    
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    food_truck3.stock(item1, 65)  

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)

    assert_equal [food_truck1, food_truck2, food_truck3], event.food_trucks
  end

  def test_it_lists_food_trucks_names
    event = Event.new("South Pearl Street Farmers Market") 
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    food_truck1.stock(item1, 35)    
    food_truck1.stock(item2, 7)    

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

    food_truck2.stock(item4, 50)    
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    food_truck3.stock(item1, 65)  

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)

    assert_equal ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"], event.food_truck_names
  end

  def test_whether_food_trucks_sell_specific_item
    event = Event.new("South Pearl Street Farmers Market") 
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    food_truck1.stock(item1, 35)    
    food_truck1.stock(item2, 7)    

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

    food_truck2.stock(item4, 50)    
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    food_truck3.stock(item1, 65)  

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)

    assert_equal [food_truck1, food_truck3], event.food_trucks_that_sell(item1)
    assert_equal [food_truck2], event.food_trucks_that_sell(item4)
  end

  def test_can_tell_food_trucks_potential_revenue
    event = Event.new("South Pearl Street Farmers Market") 
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    food_truck1.stock(item1, 35)    
    food_truck1.stock(item2, 7)    

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

    food_truck2.stock(item4, 50)    
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    food_truck3.stock(item1, 65)  

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)

    assert_equal 148.75, food_truck1.potential_revenue
    assert_equal 345.00, food_truck2.potential_revenue
    assert_equal 243.75, food_truck3.potential_revenue
  end

  def test_it_has_list_of_sorted_items
    event = Event.new("South Pearl Street Farmers Market") 
    
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    food_truck1.stock(item1, 35)    
    food_truck1.stock(item2, 7)    

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

    food_truck2.stock(item4, 50)    
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10) 

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)


    assert_equal 100 , event.total_inventory[item1][:quantity]
    assert_equal [food_truck1, food_truck3] , event.total_inventory[item1][:food_trucks]
    assert_equal 4 , event.total_inventory.count
  end

  
  def test_it_can_have_overstocked_items
    event = Event.new("South Pearl Street Farmers Market") 
    
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    
    food_truck1.stock(item1, 35)    
    food_truck1.stock(item2, 7)    
    
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    
    food_truck2.stock(item4, 50)    
    food_truck2.stock(item3, 25)
    
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10) 
    
    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)
    
    
    assert_equal [item1], event.overstocked_items
  end
  
  def test_it_has_list_of_sorted_items
    event = Event.new("South Pearl Street Farmers Market") 
    
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    food_truck1.stock(item1, 35)    
    food_truck1.stock(item2, 7)    

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

    food_truck2.stock(item4, 50)    
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10) 

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)


    assert_equal ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"], event.sorted_item_list
  end

  def test_it_has_list_of_sorted_items
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    item5 = Item.new({name: 'Onion Pie', price: '$25.00'})

    event = Event.new("South Pearl Street Farmers Market") 
    
    # event.date
    #=> "24/02/2020"
    
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    food_truck1.stock(item1, 35)    
    food_truck1.stock(item2, 7)    

    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

    food_truck2.stock(item4, 50)    
    food_truck2.stock(item3, 25)

    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    food_truck3.stock(item1, 65)

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)

    assert_equal false, event.sell(item1, 200)
    assert_equal true, event.sell(item4, 5)

    assert_equal 45, food_truck2.check_stock(item4)

    assert_equal true, event.sell(item1, 40)
    assert_equal 0, food_truck1.check_stock(item1)
    assert_equal 60, food_truck3.check_stock(item1)

  end

  
end