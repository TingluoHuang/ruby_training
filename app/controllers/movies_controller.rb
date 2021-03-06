class MoviesController < ApplicationController
    def index
        movies = Movie.includes(:director).limit(10)
        render :index, locals: { movies: movies }
    end

    def show
        movie = Movie.find(params[:id])
        render :show, locals: { movie: movie }
    end

    def create
        params.permit!
        movie = Movie.new(params[:movie])
        movie.save
        render :show, locals: { movie: movie }
    end
end