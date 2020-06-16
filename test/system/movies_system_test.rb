require "application_system_test_case"

class MoviewSystemTest < ApplicationSystemTestCase
    test "visiting the show page" do
        attributes = {title:"Parasite", director:"Bong Joon-ho"}
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

    test "visting the index page" do
        attributes = {title:"Parasite", director:"Bong Joon-ho"}
        Movie.create(attributes)
        attributes = { title: "Titanic", director: "James Cameron" }
        Movie.create(attributes)

        visit "/movies"
        assert_text "Parasite"
        assert_text "Bong Joon-ho"
        assert_text "Titanic"
        assert_text "James Cameron"
    end

    test "visting the create page" do
        attributes = {title:"Parasite", director:"Bong Joon-ho"}
        Movie.create(attributes)
        attributes = { title: "Titanic", director: "James Cameron" }
        Movie.create(attributes)

        visit "/movies"
        assert_text "Parasite"
        assert_text "Bong Joon-ho"
        assert_text "Titanic"
        assert_text "James Cameron"
    end

    test "add new movie" do
        visit "/movies"
 
        fill_in "Title", with: "Ruby on Rails"
        fill_in "Director", with: "Ting"

        click_on "Save Movie"

        assert_text "Ruby on Rails"
        assert_text "Ting"
    end
end