require('pry-byebug')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')
require_relative('../db/sql_runner.rb')


customer1 = Customer.new({"name" => "Daniel", 'funds' => 100.2})
customer2 = Customer.new({"name" => "Maria", 'funds' => 55.5})
customer3 = Customer.new({"name" => "Juan", 'funds' => 5.5})
customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({"title" => "X men", "price" => 4.5})
film2 = Film.new({"title" => "Batman", "price" => 14.99})
film1.save()
film2.save()

ticket1 = Ticket.new( {"film_id" => film1.id, "customer_id" => customer1.id} )
ticket2 = Ticket.new( {"film_id" => film2.id, "customer_id" => customer2.id} )
ticket3 = Ticket.new( {"film_id" => film2.id, "customer_id" => customer1.id} )
ticket1.save()
ticket2.save()
ticket3.save()

def buy_ticket(customer, film)
  ticket_details = create_ticket_data(customer, film)
  ticket = Ticket.new(ticket_details)

  charge_for(film.price, customer)
  customer.update()

  ticket.save()
end

def create_ticket_data(customer, film)
  data = {}
  data["customer_id"] = customer.id
  data["film_id"] = film.id
  return data
end

def charge_for(amount, customer)
  customer.funds -= amount
end

binding.pry
nil
