require 'date'

class Rental
    attr_reader :id, :car, :start_date, :end_date, :distance, :price, :commission, :actions, :options

    def initialize id, car, start_date, end_date, distance
        @id = id 
        @car = car
        @start_date = Date.parse(start_date)
        @end_date = Date.parse(end_date)
        @duration = (@end_date - @start_date).to_i + 1
        @distance = distance
        @actions = []
        @options = []
        @payment_benificiary = {'gps'=>:owner, 'baby_seat'=>:owner, 'additional_insurance'=>:drivy}
        @options_amount_per_day = {'gps'=>500, 'baby_seat'=>200, 'additional_insurance'=>1000}

        set_price
        set_commission
        set_actions
    end
    
    def add_option option
        @options.push(option.type)
        benificiary = @payment_benificiary[option.type]
        @actions[@actions.index{|a| a[:who] == benificiary.to_s}][:amount] += @options_amount_per_day[option.type] * @duration
        @actions[@actions.index{|a| a[:who] == 'driver'}][:amount] += @options_amount_per_day[option.type] * @duration
    end

    private

    def set_price
        @price = 0
        car_price = @car.price_per_day

        @price = case @duration
            when 0..1 then car_price * @duration
            when 2..4 then car_price + (@duration - 1) * car_price * 0.9
            when 5..10 then car_price + 3 * car_price * 0.9 + (@duration - 4) * car_price * 0.7
            when 11..Float::INFINITY then car_price + 3 * car_price * 0.9 + 6 * car_price * 0.7 + (@duration - 10) * car_price * 0.5
            else "Invalid Dates"
        end
        @price += @car.price_per_km * @distance
        @price.round
    end

    def set_commission
        half_commission = (@price * 0.3 * 0.5).round
        assistance_fee = 100 * @duration
        @commission = {insurance_fee: half_commission, assistance_fee: assistance_fee, drivy_fee: half_commission - assistance_fee}
    end

    def set_actions
        @actions.push(Action.new("driver", "debit", @price.round).to_h)
        @actions.push(Action.new("owner", "credit", (@price - @commission.values.sum).round).to_h)
        @actions.push(Action.new("insurance", "credit", @commission[:insurance_fee].round).to_h)
        @actions.push(Action.new("assistance", "credit", @commission[:assistance_fee].round).to_h)
        @actions.push(Action.new("drivy", "credit", @commission[:drivy_fee].round).to_h)
    end
end