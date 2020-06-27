require_relative '../level4/lib/action'

action = Action.new('third party', 'debit', 2000)

describe 'Action objects' do
    it 'can be instanciated with three parameters' do
        expect{Action.new}.to raise_error(ArgumentError)
        expect{Action.new('owner','credit',2000)}.not_to raise_error
    end
end