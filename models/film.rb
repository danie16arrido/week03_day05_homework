require_relative('./customer.rb')
require_relative('./screening.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(params)
    @id = params['id'] if params['id']
    @title = params['title']
    @price = params['price']
  end

  def save()
    sql = "
    INSERT INTO films
    (title, price)
    VALUES
    ('#{@title}', '#{@price}')
    RETURNING id;
    "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "
    UPDATE films SET
    (title, price) =
    ('#{@title}', '#{@price}')
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def delete()
    sql = "
    DELETE FROM films WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def Film.find_by_id(id)
    sql = "
    SELECT * FROM films WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    return Film.new(result.first)
  end

  def customers()
    sql= "
    SELECT c.* FROM screenings s
    INNER JOIN tickets t
    ON s.id = t.screening_id
    INNER JOIN customers c
    ON c.id = t.customer_id
    WHERE s.film_id = #{@id};
    "
    result = SqlRunner.run(sql)
    return result.map { |customer| Customer.new(customer)}
  end

  def how_many_customers()
    return customers().count()
  end

  def showing_times()
    sql = "
    SELECT start_time FROM screenings s
    WHERE s.film_id = #{@id};
    "
    result = SqlRunner.run(sql)
    return result.map { |film_screening| FilmScreening.new(film_screening).start_time}
  end

  def Film.all()
    sql ="
    SELECT * FROM films;
    "
    result = SqlRunner.run(sql)
    return result.map { |film| Film.new(film)}
  end

end
