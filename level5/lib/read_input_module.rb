require 'json'

module ReadInput
    $:.unshift File.expand_path("./../../data", __FILE__)

    def self.read_file
        input = File.read($LOAD_PATH[0] + '/input.json')
        read_file = JSON.parse(input, {symbolize_names: true})
    end

    def self.get_cars_from_input file_content
        file_content[:cars]
    end

    def self.get_rentals_from_input file_content
        file_content[:rentals]
    end

    def self.get_options_from_input file_content
        file_content[:options]
    end
end
