require 'test_helper'

class MovieTest < ActiveSupport::TestCase
    test "movie is valid with a title" do
        movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")
        assert_equal movie.title, "Parasite"
        assert_equal movie.director, "Bong Joon-ho"
    end

    test "movie is not valid with a title" do
        movie = Movie.new(title: "")
        assert_equal false, movie.valid?
    end
end

