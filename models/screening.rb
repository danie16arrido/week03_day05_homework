

class Screening
  def initialize(params)
    @id = params['id'] if params['id']
    @screening_date = params['date']
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
end
# to_timestamp('05 Dec 2000', 'DD Mon YYYY')
