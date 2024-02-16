class MovieAverageRatingUpdateService
  def initialize(review)
    @review = review
  end

  def process_record
    average_rating_not_updated = true
    while average_rating_not_updated
      begin
        movie_new_average_rating = calculate_new_average_rating_for_movie
        new_reviews_count = @review.movie.reviews_count + 1
        average_rating_not_updated = false
        @review.movie.update(average_rating: movie_new_average_rating, reviews_count: new_reviews_count)
      rescue ActiveRecord::StaleObjectError
        average_rating_not_updated = true
        @room.movie.reload
      end
    end
  end

  def calculate_new_average_rating_for_movie
    ((@review.movie.average_rating * @review.movie.reviews_count) + @review.rating) / (@review.movie.reviews_count + 1)
  end
end