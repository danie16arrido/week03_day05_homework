require('pry-byebug')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')
require_relative('../db/sql_runner.rb')


customer1 = Customer.new({"name" => "Daniel", 'funds' => 100.2})
customer2 = Customer.new({"name" => "Maria", 'funds' => 55.5})
customer1.save()
customer2.save()

film1 = Film.new({"title" => "X men", "price" => 4.5})
film2 = Film.new({"title" => "Batman", "price" => 14.99})
film1.save()
film2.save()

ticket1 = Ticket.new( {"film_id" => film1.id, "customer_id" => customer1.id} )
ticket2 = Ticket.new( {"film_id" => film2.id, "customer_id" => customer2.id} )
ticket1.save()
ticket2.save()

binding.pry
nil
