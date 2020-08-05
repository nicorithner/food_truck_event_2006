class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck| 
      truck.inventory.include?(item)
    end
  end

  def items_list
    @food_trucks.flat_map do |truck|
    truck.inventory.keys.find_all do |item|
      truck.check_stock(item)
      end
    end.uniq
  end

  def total_inventory
    total = {}
    items_list.each do |item|
      food_trucks = food_trucks_that_sell(item)
      quantity = food_trucks.sum {|truck| truck.check_stock(item)}
      total[item] = {food_trucks: food_trucks, quantity: quantity}
    end
    total
  end

  def sorted_item_list
    items_list.map do |item|
      item.name
    end.sort
  end

  def overstocked_items
    items_list.find_all do |item|
      food_trucks_that_sell(item).count > 1 &&
    total_inventory[item][:quantity] > 50
    end
  end

  def sell(item, amount)
    total_inventory[item][:quantity] >= amount ? total_inventory[item][:quantity] -= amount : false
    
    #  binding.pry
  
  end
end