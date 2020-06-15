require "application_system_test_case"

class MoviewSystemTest < ApplicationSystemTestCase
    test "visiting the show page" do
        attributes = {title:"Parasite", director:"Bing Joon-ho"}
        movie = Movie.create(attributes)

        visit "/movies/#{movie.id}"
        assert_text "Parasite"
        assert_text "Bong Joon-ho"
    end

    test "visiting the show page for another movie" do

        attributes = { title: "Titanic", director: "James Cameron" }
        movie = Movie.create(attributes)

        visit "/movies/#{movie.id}"
        assert_text "Titanic"
        assert_text "James Cameron"
    end
end