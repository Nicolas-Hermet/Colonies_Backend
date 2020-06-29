require_relative '../level5/main'

input = ReadInput.read_file

describe 'Main create_cars_array_from_input' do
    it 'should not raise any error' do
        expect{create_cars_array_from_input input}.not_to raise_error
    end

    it 'should create an actual Car objects array from the input' do
        expect(create_cars_array_from_input(input).class).to eq(Array)
    end
    
    it 'should contain only Car Objects' do
        random_index = rand($cars.length - 1)
        expect($cars[random_index]).to be_instance_of(Car)
    end
end

describe 'Main create_rentals_array_from_input' do
    it 'should not raise any error' do
        expect{create_rentals_array_from_input input}.not_to raise_error
    end

    it 'should create an actual Car objects array from the input' do
        expect(create_rentals_array_from_input(input).class).to eq(Array)
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

describe 'Main create_options_array_from_input' do
    it 'should not raise any error' do
        expect{create_options_array_from_input input}.not_to raise_error
    end

    it 'should create an actual array of Option objects from the input' do
        expect($options.class).to eq(Array)
    end
    
    it 'should contain only Option Objects' do
        random_index = rand($options.length - 1)
        expect($options[random_index]).to be_instance_of(Option)
    end
end

describe 'Main rental_from_its_id' do
    it 'get a rental from $rentals thanks to an id' do
        expect(rental_from_its_id 1).to be_instance_of(Rental)
    end

    it 'get the right rental from $rentals' do
        actual_rental = rental_from_its_id(1)
        should_be_rental = Rental.new(1,car_from_its_id(1),"2015-12-8","2015-12-8",100)
        expect(actual_rental.id).to be(should_be_rental.id)
        expect(actual_rental.car).to be(should_be_rental.car)
        expect(actual_rental.start_date).to eq(should_be_rental.start_date)
        expect(actual_rental.end_date).to eq(should_be_rental.end_date)
        expect(actual_rental.distance).to be(should_be_rental.distance)
    end
end

describe 'Main write_output' do
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
        it 'has three items' do
            expect(returned_output[:rentals].length).to be(3)
        end

        describe 'each rental and Action' do
            rentals.each do |rental|
                it 'has an id integer, an array of options and an array of actions for each item' do
                    expect(rental).to have_key(:id)
                    expect(rental[:id]).to be_instance_of(Integer)
                    expect(rental).to have_key(:actions)
                    expect(rental[:actions]).to be_instance_of(Array)
                    expect(rental[:actions].length).to be(5)
                    expect(rental).to have_key(:options)
                    expect(rental[:options]).to be_instance_of(Array)
                end

                rental[:actions].each do |action|
                    it 'each action has a \'who\', \'type\' and \'amount\' key' do
                        expect(action).to have_key(:who)
                        expect(action[:who]).to be_instance_of(String)
                        expect(action[:who]).to match(/(driver)|(owner)|(insurance)|(assistance)|(drivy)/)
                        expect(action).to have_key(:type)
                        expect(action[:type]).to be_instance_of(String)
                        expect(action[:type]).to match(/(debit)|(credit)/)
                        expect(action).to have_key(:amount)
                        expect(action[:amount]).to be_instance_of(Integer)
                    end

                    it 'each action has a \'who\', \'type\' and \'amount\' key' do
                        expect(action).to have_key(:who)
                        expect(action[:who]).to be_instance_of(String)
                        expect(action).to have_key(:type)
                        expect(action[:type]).to be_instance_of(String)
                        expect(action).to have_key(:amount)
                        expect(action[:amount]).to be_instance_of(Integer)
                    end
                end

                rental[:options].each do |option|
                    it 'each option is either a gps or baby_seat or additional_insurance' do
                        expect(option).to be_instance_of(String)
                        expect(option).to match(/(gps)|(baby_seat)|(additional_insurance)/)
                    end

                    it 'options have no duplicate' do
                        expect(rental[:options].count(option)).to eq(1)
                    end
                end
            end
        end

        first_rental_driver_action = rentals[0][:actions].select { |action| action[:who] == 'driver' }[0]
        it 'has correct price and commission' do
            expect(first_rental_driver_action[:type]).to eq('debit')
            expect(first_rental_driver_action[:amount]).to eq(3700) # 3000 of rentals + 500+200 from options
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