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
