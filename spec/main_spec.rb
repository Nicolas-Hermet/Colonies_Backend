require_relative '../level1/main'

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

describe 'Main write_output' do
    create_cars_array_from_input
    create_rentals_array_from_input
    returned_output = write_output
    
    it 'has a returned value' do
        expect(returned_output).not_to eq(nil)
    end

    it 'returned value has rentals key' do
        expect(returned_output).to have_key(:rentals)
        expect(returned_output[:rentals]).to be_instance_of(Array)
    end

    describe 'rentals array' do
        rentals = returned_output[:rentals]
        it 'has three objects' do
            expect(returned_output[:rentals].length).to be(3)
        end
    
        it 'has an id and price key for each object' do
            rentals.each do |rental|
                expect(rental).to have_key(:id)
                expect(rental).to have_key(:price)
            end
        end
    end

    path_to_file = "#{$MAIN_ROOT}/data/actual_output.json"

    it 'create a new file' do
        expect(File.exist?(path_to_file)).to be(true)
    end

    it 'output file is not empty' do
        expect(File.size(path_to_file)).to be > 0
    end

end