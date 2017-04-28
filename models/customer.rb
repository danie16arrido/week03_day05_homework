

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(params)
    @id = params['id'] if params['id']
    @name = params['name']
    @funds = params['funds']
  end

  def save()
    sql = "
    INSERT INTO customers
    (name, funds) VALUES
    ('#{@name}', #{@funds})
    RETURNING id;
    "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i

  end

end
