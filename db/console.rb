require('pry-byebug')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')
require_relative('../models/screening.rb')
require_relative('../models/film_screening.rb')
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




data = {}
data['film_id'] = film1.id
data['start_time'] = '12:00'
data['finish_time'] = '15:00'
data['screening_date'] = "1 3 2009"

screening1 = Screening.new(data)
screening1.save()

# film_screening2 = FilmScreening.new(data)
# film_screening2.start_time = '18:00'
# film_screening2.finish_time = '21:00'
# film_screening2.save()

ticket1 = Ticket.new( {"customer_id" => customer1.id, "screening_id" => screening1.id} )
# ticket2 = Ticket.new( {"film_id" => film2.id, "customer_id" => customer2.id} )
# ticket3 = Ticket.new( {"film_id" => film2.id, "customer_id" => customer1.id} )
# ticket1.save()
# ticket2.save()
# ticket3.save()





def buy_ticket(customer, screening)
  ticket_details = create_ticket_data(customer, screening)
  ticket = Ticket.new(ticket_details)
  film = Film.find_by_id(screening.film_id)


  charge_for(film.price.to_f, customer)
  customer.update()

  ticket.save()
end

def create_ticket_data(customer, screening)
  data = {}
  data["customer_id"] = customer.id
  data["screening_id"] = screening.id
  return data
end

def charge_for(amount, customer)
  customer.funds -= amount
end

buy_ticket(customer2, screening1)

binding.pry
nil
