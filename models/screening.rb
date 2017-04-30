

class Screening

  attr_reader :id
  attr_accessor :film_id, :screening_date, :start_time, :finish_time, :capacity

  def initialize(params)
    @id = params['id'] if params['id']
    @film_id = params['film_id']
    @screening_date = params['screening_date']
    @start_time = params['start_time']
    @finish_time = params['finish_time']
    @tickets_sold = 0
    @capacity = params['capacity']
  end

  def save()
    sql = "
    INSERT INTO screenings
    (film_id, start_time, finish_time, screening_date, tickets_sold, capacity)
    VALUES (
    #{@film_id},
    '#{@start_time}',
    '#{@finish_time}',
    to_date('#{@screening_date}', 'DD MM YYYY'),
    #{@tickets_sold},
    #{@capacity})
    RETURNING id;
    "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def delete()
    sql = "
    DELETE FROM screenings WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end

  def Screening.all()
    sql = "
    SELECT * FROM screenings;
    "
    result = SqlRunner.run(sql)
    return result.map { |screening| Screening.new(screening)}
  end

  def update()
    sql = "
    UPDATE screenings SET
    (film_id, start_time, finish_time, screening_date, tickets_sold, capacity) =
    (
      #{@film_id},
      '#{@start_time}',
      '#{@finish_time}',
      to_date('#{@screening_date}', 'DD MM YYYY'),
      #{@tickets_sold},
      #{@capacity}
    )
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end
end
