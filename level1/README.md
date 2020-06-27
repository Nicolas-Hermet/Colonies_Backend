# Intro

We are building a peer-to-peer car rental service. Let's call it Getaround :)

Here is our plan:

- Let any car owner list her car on our platform
- Let any person (let's call him 'driver') book a car for given dates/distance

# Level 1

The car owner chooses a price per day and price per km for her car.
The driver then books the car for a given period and an approximate distance.

The rental price is the sum of:

- A time component: the number of rental days multiplied by the car's price per day
- A distance component: the number of km multiplied by the car's price per km

# Answer

All right.
It took me some time to figure out what architecture would be nice to solve this.
I also thought it'd be good to read through the five levels before doing anything.

It appears to me that the "smartest" way, as per my skills, is to: 
- design a module that will be able to read input file.
- design a Car class, that will have read only attributes id, price_per_day and price_per_km
- design a Rental class that will have read only attributes id, car (from Car class), start_date, end_date, distance and an output attribute in attr_accessor.
- add a private method in the Rental class, that can compute its output attributes on initialization.
- design a module that can write the output file.
- make main.rb do a loop with the previous modules to produce the output.
in that order

This way, for each level, only the Rental's private method would have to be changed.