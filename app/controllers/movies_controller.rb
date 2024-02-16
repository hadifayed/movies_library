class MoviesController < ApplicationController
	def index
    movies = Movie.all.order(average_rating: :desc)

    render json: movies
	end
end
