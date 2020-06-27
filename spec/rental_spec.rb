require_relative '../level1/lib/rental'
require_relative '../level1/lib/car'

rental = Rental.new 1, Car.new(1,2000,10), "2017-12-8", "2017-12-10", 100

describe 'Rental objects' do
    it 'can be instantiated with three arguments' do
        expect{Rental.new}.to raise_error(ArgumentError)
        expect{Rental.new 1, Car.new(1,2000,10), "2017-12-8", "2017-12-10", 100}.not_to raise_error
    end

    it 'have an id, car, start_date, end_date, distance attribute' do
        expect(rental).to respond_to(:id, :car, :start_date, :end_date, :distance)
    end

    it 'have a price attribute' do
        expect(rental).to respond_to(:price)
    end

    # We should here check that Rentals attribute cannot be changed.

    it "can compute price" do
        expect(rental.send(:get_price)).to eq(7000) # 3 days for 2000 each + 100km for 10 each
    end
end