require 'date'

class Rental
    attr_reader :id, :car, :start_date, :end_date, :distance, :price

    def initialize id, car, start_date, end_date, distance
        @id = id 
        @car = car
        @start_date = Date.parse(start_date)
        @end_date = Date.parse(end_date)
        @distance = distance

        @price = get_price
    end

    private

    def get_price
        @car.price_per_day * (@end_date - @start_date).to_i + @car.price_per_km * @distance
    end
end