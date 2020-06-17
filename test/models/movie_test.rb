require 'test_helper'

class MovieTest < ActiveSupport::TestCase

    def setup
        Rails.application.load_seed
    end

    test "movie is valid with a title" do
        director = Director.new(name: "Bong Joon-ho", age: 50);
        movie = Movie.new(title: "Parasite", director: director)
        assert_equal movie.title, "Parasite"
        assert_equal movie.director.name, "Bong Joon-ho"
    end

    test "movie is not valid with a title" do
        movie = Movie.new(title: "")
        assert_equal false, movie.valid?
    end

    test "return movie titles" do
        assert_equal 5045, Movie.titles().count
    end

    test "test movie facebook_likes" do
        assert_equal "Interstellar", Movie.like().first().title
    end

    test "test movie show year released" do
        assert_equal "2015", Movie.year_released("Run All Night")
    end

    test "test movie more than like" do
        assert_equal 2864, Movie.more_than_likes(0)
    end

    test "test most liked by director name and plot" do
        movie = Movie.most_liked_by_director_name_and_plot("Christopher Nolan", "foul play")
        assert_equal "Memento", movie.title
    end
end

