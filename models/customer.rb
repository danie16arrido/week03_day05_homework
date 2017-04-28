

class Customer

  def initialize(params)
    @id = params['id'] if params['id']
    @name = params['name']
    @funds = params['funds']
  end

end
