require 'Bike'

describe Bike do
	it { is_expected.to respond_to :working?}
	

	it 'gets a bike and expects it to be working' do
		bike = Bike.new
		expect(bike).to be_working
	end

	it 'broken bike' do
		bike = Bike.new
		bike.break
		expect(bike.working?).to eq false
	end
end
