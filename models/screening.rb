

class Screening
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
end
