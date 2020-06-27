require_relative '../level1/main'
require_relative '../level1/lib/car'

describe 'Main create_cars_array_from_input' do
    it 'should not raise any error' do
        expect{create_cars_array_from_input}.not_to raise_error
    end

    it 'should create an actual Car objects array from the input' do
        expect(create_cars_array_from_input.class).to eq(Array)
    end
    
    it 'should contain only Car Objects' do
        random_index = rand($cars.length - 1)
        expect($cars[random_index]).to be_instance_of(Car)
    end
end

describe 'Main create_rentals_array_from_input' do
    it 'should not raise any error' do
        expect{create_rentals_array_from_input}.not_to raise_error
    end

    it 'should create an actual Car objects array from the input' do
        expect(create_rentals_array_from_input.class).to eq(Array)
    end
    
    it 'should contain only Car Objects' do
        random_index = rand($rentals.length - 1)
        expect($rentals[random_index]).to be_instance_of(Rental)
    end
end

describe 'Main car_from_its_id' do
    it 'get a car from $cars thanks to an id' do
        expect(car_from_its_id 1).to be_instance_of(Car)
    end

    it 'get the right car from $cars' do
        actual_car = car_from_its_id(1)
        should_be_car = Car.new(1, 2000, 10)
        expect(actual_car.id).to be(should_be_car.id)
        expect(actual_car.price_per_day).to be(should_be_car.price_per_day)
        expect(actual_car.price_per_km).to be(should_be_car.price_per_km)
    end
end
