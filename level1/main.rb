$:.unshift File.expand_path("./../lib", __FILE__)
require 'read_input_module'
require 'Car'
require 'Rental'

$MAIN_ROOT = File.dirname __FILE__
$cars = []
$rentals = []
def create_cars_array_from_input
    ReadInput.get_cars_from_input.each do |car|
        $cars.push(Car.new(car[:id], car[:price_per_day], car[:price_per_km]))
    end
end

def create_rentals_array_from_input
    ReadInput.get_rentals_from_input.each do |rental|
        $rentals.push(Rental.new(rental[:id], car_from_its_id(rental[:car_id]), rental[:start_date], rental[:end_date], rental[:distance]))
    end
end

def car_from_its_id car_id
    $cars[$cars.index{|c| c.id === car_id}]
end

def write_output
    output = {rentals: []}
    $rentals.each{|r| output[:rentals].push({id: r.id, price: r.price})}
    File.open("#{$MAIN_ROOT}/data/actual_output.json",'w') do |f|
        f.write(output.to_json)
    end
    output
end
