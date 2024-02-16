module CsvImport
  class UserReviewDataService < BaseService
    def process_row(row_data)
      movie = set_movie(row_data)
      user = set_user(row_data)
      review = set_review(row_data, user, movie)
    end

    def set_movie(row_data)
      Movie.find_by(name: row_data['Movie'])
    end

    def set_user(row_data)
      User.find_or_create_by(name: row_data['User'])
    end

    def set_review(row_data, user, movie)
      Review.find_or_create_by(movie_id: movie.id, user_id: user.id) do |review|
        review.comment = row_data['Review']
        review.rating = row_data['Stars']
      end
    end
  end
end
