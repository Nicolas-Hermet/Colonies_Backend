require_relative '../level5/lib/option'

describe 'Option objects' do
    rental = Rental.new 1, Car.new(1,2000,10), "2017-12-8", "2017-12-10", 100
    
    it 'can be instanciated with three parameters' do
        expect{Option.new}.to raise_error(ArgumentError)
        expect{Option.new(1,rental,'swiming pool')}.not_to raise_error
    end

    it 'has readable attributes' do
        option = Option.new(1,rental,'swiming pool')
        expect{option.id}.not_to raise_error
        expect(option.id).to be_instance_of(Integer)
        expect{option.rental}.not_to raise_error
        expect(option.rental).to be_instance_of(Rental)
        expect{option.type}.not_to raise_error
        expect(option.type).to be_instance_of(String)
    end
end