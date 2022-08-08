class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies.as_json
  end

  def create
    movie = Movie.new(
      title: params[:title],
      director: params[:director],
      year: params[:year],
      starring: params[:starring],
    )
    movie.save
    render json: movie.as_json
  end

  def show
    movie = Movie.find_by(id: params[:id])
    render json: movie.as_json
  end

  def update
    movie = Movie.find_by(id: params[:id])
    movie.title = params[:title] || movie.title
    movie.director = params[:director] || movie.director
    movie.year = params[:year] || movie.year
    movie.starring = params[:starring] || movie.starring
    movie.save
    render json: movie.as_json
  end

  def destroy
    movie = Movie.find_by(id: params[:id])
    movie.destroy
    render json: { message: "goodby movie: it's gone" }
  end
end
