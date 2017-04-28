require('pry-byebug')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')
require_relative('../db/sql_runner.rb')


customer1 = Customer.new({"name" => "Daniel", 'funds' => 100.2})
customer2 = Customer.new({"name" => "Maria", 'funds' => 55.5})

# film1 = Film.new("X men", 4)
# film2 = Film.new("Batman", 14)

binding.pry
nil
