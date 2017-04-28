

class Ticket

  def initialize(params)
    @id = params['id']
    @customer_id = params['customer_id']
    @film_id = params['film_id']
  end
end
