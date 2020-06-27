require 'date'

class Rental
    attr_reader :id, :car, :start_date, :end_date, :distance, :price

    def initialize id, car, start_date, end_date, distance
        @id = id 
        @car = car
        @start_date = Date.parse(start_date)
        @end_date = Date.parse(end_date)
        @duration = (@end_date - @start_date).to_i + 1
        @distance = distance

        @price = set_price
    end

    private

    def set_price
        price = 0
        car_price = @car.price_per_day

        price = case @duration
            when 0..1 then car_price * @duration
            when 2..4 then car_price + (@duration - 1) * car_price * 0.9
            when 5..10 then car_price + 3 * car_price * 0.9 + (@duration - 4) * car_price * 0.7
            when 11..Float::INFINITY then car_price + 3 * car_price * 0.9 + 6 * car_price * 0.7 + (@duration - 10) * car_price * 0.5
            else "Invalid Dates"
        end
        price += @car.price_per_km * @distance
        price.round
    end
end