require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
    test "FIXTURES - director has a name and age" do
        director = directors(:bong_joon_ho)
        assert_equal "Bong Joon-ho", director.name
        assert_equal 44, director.age
        assert_equal 1, director.movies.count
    end

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

    test "director using factory_bot" do
        director = build(:director)
        assert_equal 0, director.movies.count

        movies = create_list(:movie, 3, director:director)
        #movie = build(:movie)
        assert_equal 3, director.movies.count
    end
    
end