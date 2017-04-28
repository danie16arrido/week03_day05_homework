require('pry-byebug')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')


customer1 = Customer.new({'name' =>"Daniel", 'founds' =>100})
customer2 = Customer.new({'name' => "Maria", 'founds' => 55})

# film1 = Film.new("X men", 4)
# film2 = Film.new("Batman", 14)

binding.pry
nil
