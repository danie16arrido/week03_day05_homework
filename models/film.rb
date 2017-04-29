

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
    DELETE * FROM films WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

end
