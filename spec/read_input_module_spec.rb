require_relative '../level1/lib/read_input_module'

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