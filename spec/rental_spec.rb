require_relative '../level5/lib/rental'
require_relative '../level5/lib/car'

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

    it 'have a price attribute' do
        expect(rental).to respond_to(:price)
    end

    it 'have a commission attribute' do
        expect(rental).to respond_to(:commission)
        expect(rental.commission).to have_key(:insurance_fee)
        expect(rental.commission).to have_key(:assistance_fee)
        expect(rental.commission).to have_key(:drivy_fee)
    end

    # We should here check that Rentals attribute cannot be changed.

    it "can compute price" do
        expect(rental.send(:set_price)).to eq(6600) # 3 days for (2000 + 2*2000-10%) + 100km for 10 each
        expect(rental.send(:set_price).class).to be(Integer)
    end

    it "can compute commission" do
        expect(rental.send(:set_commission).class).to be(Hash)
        expect(rental.commission[:insurance_fee]).to be(990) # price(6600) * 0.3 * 0.5
        expect(rental.commission[:assistance_fee]).to be(300) # 100 * number of days
        expect(rental.commission[:drivy_fee]).to be(690) # price(6600) * 0.3 * 0.5 - 100 * nb_of_days
    end

    it 'can compute actions' do
        random_index = rand(rental.actions.length - 1)
        expect(rental.send(:set_actions)).to be_instance_of(Array)
        expect(rental.actions[random_index]).to be_instance_of(Hash)
        expect(rental.actions[0][:who]).to eq('driver')
        expect(rental.actions[0][:type]).to eq('debit')
        expect(rental.actions[0][:amount]).to be(6600)
    end
end