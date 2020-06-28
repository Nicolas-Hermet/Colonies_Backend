require 'json'

module ReadInput
    $:.unshift File.expand_path("./../../data", __FILE__)

    def self.read_file
        input = File.read($LOAD_PATH[0] + '/input.json')
        JSON.parse(input, {symbolize_names: true})
    end

    def self.get_cars_from_input
        read_file[:cars]
    end

    def self.get_rentals_from_input
        read_file[:rentals]
    end

    def self.get_options_from_input
        read_file[:options]
    end
end
