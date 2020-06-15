class MoviesController < ApplicationController
    def show
        m = Movie.find(params[:id])
        @title = m.title
        @director = m.director
    end
end