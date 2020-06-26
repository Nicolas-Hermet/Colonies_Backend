require 'json'

module ReadInput
    $:.unshift File.expand_path("./../../data", __FILE__)

    def self.read_file
        input = File.read($LOAD_PATH[0] + '/input.json')
        JSON.parse(input, {symbolize_names: true})
    end
end
