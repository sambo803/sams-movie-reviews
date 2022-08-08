class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: { message: "hello index!" }
  end
end
