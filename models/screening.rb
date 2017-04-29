

class Screening

  attr_reader :id
  attr_accessor :screening_date

  def initialize(params)
    @id = params['id'] if params['id']
    @screening_date = params['screening_date']
  end

  def save()
    sql = "
    INSERT INTO screenings
    (screening_date) VALUES (to_timestamp('#{@screening_date}', 'DD MM YYYY'))
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
    (screening_date) = (to_timestamp('#{@screening_date}', 'DD MM YYYY'))
    WHERE id = #{@id};
    "
    SqlRunner.run(sql)
  end
end
