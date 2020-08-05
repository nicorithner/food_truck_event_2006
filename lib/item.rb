class Item
	attr_reader :name, :price
	def initialize(data)
		@name = data[:name]
		@price = data[:price].gsub('$', '').to_f
	end
	
	def method
		
	end

	def method1
		
	end

	def method1
		
	end
end