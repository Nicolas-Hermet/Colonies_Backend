require_relative '../level2/lib/read_input_module'

describe 'Read file method' do
    method = ReadInput.read_file

    it 'should not have any errors' do
        expect{method}.not_to raise_error
    end

    it 'should return a Hash' do
        expect(method.class).to eq(Hash)
    end

    it 'returned hash should have cars and rentals attributes' do
        expect(method).to have_key(:cars)
        expect(method).to have_key(:rentals)
    end
end

describe 'Get cars Array from input' do
    get_cars = ReadInput.get_cars_from_input
    it 'should not raise any error' do
        expect{get_cars}.not_to raise_error
    end

    it 'should return an Array' do
        expect(get_cars.class).to eq(Array)
    end

    it 'should have 3 elements' do
        expect(get_cars.length).to eq(3)
    end

    it 'should be the correct data' do
        expect(get_cars[0]).to eq({ "id": 1, "price_per_day": 2000, "price_per_km": 10 })
    end
end

describe 'Get rentals Array from input' do
    get_rentals = ReadInput.get_rentals_from_input
    it 'should not raise any error' do
        expect{get_rentals}.not_to raise_error
    end

    it 'should return an Array' do
        expect(get_rentals.class).to eq(Array)
    end

    it 'should have 3 elements' do
        expect(get_rentals.length).to eq(3)
    end

    it 'should be the correct data' do
        expect(get_rentals[0]).to eq({ "id": 1, "car_id": 1, "start_date": "2017-12-8", "end_date": "2017-12-10", "distance": 100 })
    end
end