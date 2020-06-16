require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
    test "director has a name and age" do
        director = Director.create!(name: "Bong Joon-ho", age: 50);

        assert_equal "Bong Joon-ho", director.name
        assert_equal 50, director.age

        assert_equal 0, director.movies.count

        # movie = director.movies.create!(title: "Parasite", facebook_likes: 70, plot_keywords: "snow", year: 2013)

        movie = Movie.new(title: "Parasite", facebook_likes: 70, plot_keywords: "snow", year: 2013)

        director.movies << [movie]
        assert_equal 1, director.movies.count
    end
end