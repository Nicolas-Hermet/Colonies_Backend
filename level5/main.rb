$:.unshift File.expand_path("./../lib", __FILE__)
require 'read_input_module'
require 'Car'
require 'Rental'
require 'Action'
require 'Option'

$MAIN_ROOT = File.dirname __FILE__

def perform
    $cars = []
    $rentals = []
    $options = []
    input = ReadInput.read_file
    create_cars_array_from_input input
    create_rentals_array_from_input input
    create_options_array_from_input input
    add_options_to_rentals
    write_output
end

def create_cars_array_from_input input
    ReadInput.get_cars_from_input(input).each do |car|
        $cars.push(Car.new(car[:id], car[:price_per_day], car[:price_per_km]))
    end
end

def create_rentals_array_from_input input
    ReadInput.get_rentals_from_input(input).each do |rental|
        $rentals.push(Rental.new(rental[:id], car_from_its_id(rental[:car_id]), rental[:start_date], rental[:end_date], rental[:distance]))
    end
end

def car_from_its_id car_id
    $cars[$cars.index{|c| c.id === car_id}]
end

def create_options_array_from_input input
    ReadInput.get_options_from_input(input).each do |option|
        $options.push(Option.new(option[:id], rental_from_its_id(option[:rental_id]), option[:type]))
    end
end

def add_options_to_rentals
    $options.each do |option|
        option.rental.add_option option
    end
end

def rental_from_its_id rental_id
    $rentals[$rentals.index{|c| c.id === rental_id}]
end

def write_output
    output = {rentals: []}
    $rentals.each{|r| output[:rentals].push({id: r.id, options: r.options, actions: r.actions})}
    File.open("#{$MAIN_ROOT}/data/actual_output.json",'w') do |f|
        f.write(output.to_json)
    end
    output
end

perform