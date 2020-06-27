require_relative '../level4/lib/car'

describe 'Car objects' do
    it 'can be instantiated with three arguments' do
        expect{Car.new}.to raise_error(ArgumentError)
        expect{Car.new 1, 10, 100}.not_to raise_error
    end

    car = Car.new 1, 10, 100
    it 'have an id, price_per_day, price_per_km attribute' do
        expect(car).to respond_to(:id, :price_per_day, :price_per_km)
    end

    # We should here check that Cars attribute cannot be changed.
end