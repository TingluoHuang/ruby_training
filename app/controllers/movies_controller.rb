class MoviesController < ApplicationController
    def show
        id = params[:id]
        if id == "1"
           @movie= Movie.new("Parasite", "Bong Joon-ho")
        elsif id == "2"
            @movie= Movie.new("Titanic", "James Cameron")
        else
           raise "404"
        end
    end
end