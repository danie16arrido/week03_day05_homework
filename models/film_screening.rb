

class FilmScreening()

  attr_reader :id
  attr_accessor

  def initialize(params)
    @id = params['id'] if params['id']
    @film_id = params['film_id']
    @screening_id = params['screening_id']
    @start = params['start']
  end
  
end
