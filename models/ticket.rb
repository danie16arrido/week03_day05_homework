

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(params)
    @id = params['id'] if params['id']
    @customer_id = params['customer_id']
    @film_id = params['film_id']
  end

  def save()
    sql = "
    INSERT INTO tickets
    (customer_id, film_id)
    VALUES
    (#{@customer_id}, #{@film_id})
    RETURNING id;
    "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "
    UPDATE tickets SET
    (customer_id, film_id) =
    (#{@customer_id}, #{@film_id})
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM tickets WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end
end
