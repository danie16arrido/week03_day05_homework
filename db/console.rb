require('pry-byebug')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')
require_relative('../db/sql_runner.rb')


customer1 = Customer.new({"name" => "Daniel", 'funds' => 100.2})
customer2 = Customer.new({"name" => "Maria", 'funds' => 55.5})

film1 = Film.new({"title" => "X men", "price" => 4.5})
film2 = Film.new({"title" => "Batman", "price" => 14.99})

binding.pry
nil
