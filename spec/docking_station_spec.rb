require 'docking_station'

describe DockingStation do

	describe '#release_bike' do
			it 'raises an error when there are no bikes available' do
				expect { subject.release_bike }.to raise_error 'No bikes available'
			end
			it 'releases a bike' do
				bike = Bike.new
				subject.dock(bike)
				expect(subject.release_bike).to eq bike
			end
	end

	describe '#dock' do
		it 'raises an error when the dock is full' do
			20.times{ subject.dock(Bike.new) }
			expect { subject.dock( Bike.new) }.to raise_error 'Docking station full'
		end

		it 'docks something' do
			expect(subject).to respond_to (:dock)
			bike = Bike.new
			subject.dock(bike)
			expect(subject.bikes.last).to eq bike
		end
	end

	it 'variable capacity' do
		DS = DockingStation.new(30)

		expect(DS.capacity).to eq 30
	end

	it 'dock and release a broken bike' do
		broken_bike = Bike.new
		broken_bike.break
		subject.dock(broken_bike)
		expect { subject.release_bike }.to raise_error 'This bike is broken'
	end

end
