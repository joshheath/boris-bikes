class Bike
	attr_reader :works

	def initialize
		@works = true
	end

	def working?
		@works
	end

	def break
		@works = false
	end
end

