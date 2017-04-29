class FilmScreening

  attr_reader :id
  attr_accessor :film_id, :screening_id, :start_time, :finish_time

  def initialize(params)
    @id = params['id'] if params['id']
    @film_id = params['film_id']
    @screening_id = params['screening_id']
    @start_time = params['start_time']
    @finish_time = params['finish_time']
  end

  def save()
    sql = "
    INSERT INTO films_screenings
    (film_id, screening_id, start_time, finish_time) VALUES
    (#{@film_id}, #{@screening_id}, '#{@start_time}', '#{@finish_time}')
    RETURNING id;
    "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end
end
