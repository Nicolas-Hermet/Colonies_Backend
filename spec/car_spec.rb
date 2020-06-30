require_relative '../level5/lib/car'

describe 'Car objects' do
    it 'can be instantiated with three arguments' do
        expect{Car.new}.to raise_error(ArgumentError)
        expect{Car.new 1, 10, 100}.not_to raise_error
    end

    car = Car.new 1, 10, 100
    it 'have an id, price_per_day, price_per_km attribute' do
        expect(car).to respond_to(:id, :price_per_day, :price_per_km)
    end

    it 'attributes cannot be modified from outside the car class' do
        expect{car.id = -1}.to raise_error(NoMethodError)
        expect{car.price_per_day = 666}.to raise_error(NoMethodError)
        expect{car.price_per_km = 666}.to raise_error(NoMethodError)
    end
end