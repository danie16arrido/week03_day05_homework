

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

  def update()
    sql = "
    UPDATE customers SET
    (name, funds) =
    ('#{name}', #{funds})
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM customers WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def Customer.find_by_id(id)
    sql = "
    SELECT * FROM customers WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    return result.map { |customer| Customer.new(customer) }

  end

  def Customer.all()
    sql = "
    SELECT * FROM customers;
    "
    return Customer.get_many(sql)
  end

  def Customer.get_many(sql)
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer)}
  end
end
