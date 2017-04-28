

clas Film

  def initialize(params)
    @id = params['id'] if params['id']
    @title = params['title']
    @price = params['price']
  end

end
