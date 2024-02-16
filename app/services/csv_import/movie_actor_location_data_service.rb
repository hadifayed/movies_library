module CsvImport
  class MovieActorLocationDataService < BaseService
    def process_row(row_data)
      movie = set_movie(row_data)
      actor = set_actor(row_data)
      location = set_location(row_data)
      set_movie_actor_location(movie, actor, location)
    end

    def set_movie(row_data)
      Movie.find_or_create_by(name: row_data['Movie']) do |movie|
        movie.description = row_data['Description']
        movie.year = row_data['Year']
        movie.director = row_data['Director']
      end
    end

    def set_actor(row_data)
      Actor.find_or_create_by(name: row_data['Actor'])
    end

    def set_location(row_data)
      Location.find_or_create_by(name: row_data['Filming location']) do |location|
        location.country = row_data['Country']
      end      
    end

    def set_movie_actor_location(movie, actor, location)
     MovieActorLocation.find_or_create_by(movie_id: movie.id, actor_id: actor.id, location_id: location.id)
    end
  end
end