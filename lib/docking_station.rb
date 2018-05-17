require_relative 'Bike'

class DockingStation
	attr_reader :bikes, :capacity
	DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity 
	end

	def release_bike
		fail 'No bikes available' if empty? 
		fail 'This bike is broken' unless @bikes.last.working?
		@bikes.pop
	end

	def dock(bike)
		fail 'Docking station full' if full?
		@bikes.push(bike)
	end

	private

	def full?
		@bikes.length >= DEFAULT_CAPACITY
	end

	def empty?
		@bikes.empty?
	end
end
