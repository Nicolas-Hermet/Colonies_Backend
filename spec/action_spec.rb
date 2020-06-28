require_relative '../level5/lib/action'

action = Action.new('third party', 'debit', 2000)

describe 'Action objects' do
    it 'can be instanciated with three parameters' do
        expect{Action.new}.to raise_error(ArgumentError)
        expect{Action.new('owner','credit',2000)}.not_to raise_error
    end

    it 'has a to_h method' do
        action = Action.new('owner','credit',2000)
        expect(action).to respond_to(:to_h)
        expect(action.to_h).to be_instance_of(Hash)
        expect(action.to_h).to eq({who: 'owner', type: 'credit', amount: 2000})
    end
end