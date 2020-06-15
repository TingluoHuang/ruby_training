class MoviesController < ApplicationController
    def show
        m = Movie.find(params[:id])
        m.put()
        @title = m.title
        @director = m.direcotr
    end
end