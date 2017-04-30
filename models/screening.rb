

class Screening

  attr_reader :id
  attr_accessor :screening_date

  def initialize(params)
    @id = params['id'] if params['id']
    @film_id = params['film_id']
    @screening_date = params['screening_date']
    @start_time = params['start_time']
    @finish_time = params['finish_time']
    # @tickets_sold = 0
  end

  def save()
    sql = "
    INSERT INTO screenings
    (film_id, start_time, finish_time)
    VALUES
    (#{@film_id}, '#{@start_time}', '#{@finish_time}')
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
    (screening_date) = ('#{@screening_date}')
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end
end
