require 'test_helper'

class MovieTest < ActiveSupport::TestCase

    def setup
        Rails.application.load_seed
    end

    test "movie is valid with a title" do
        movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")
        assert_equal movie.title, "Parasite"
        assert_equal movie.director, "Bong Joon-ho"
    end

    test "movie is not valid with a title" do
        movie = Movie.new(title: "")
        assert_equal false, movie.valid?
    end

    test "return movie titles" do
        assert_equal 4997, Movie.titles().count
    end

    test "test movie facebook_likes" do
        assert_equal "Interstellar", Movie.like().first().title
    end

    test "test movie show year released" do
        assert_equal "2015", Movie.year_released("Run All Night")
    end

    test "test movie more than like" do
        assert_equal 2823, Movie.more_than_likes(0)
    end
end

