require "application_system_test_case"

class MoviewSystemTest < ApplicationSystemTestCase
    test "visiting the show page" do

        director = create(:director, name: "Bong Joon-ho")
        movie = create(:movie, title:"Parasite", director:director)

        # movie.save!
        movie = Movie.find_by(title: movie.title)
        #attributes = {title:"Parasite", director:"Bong Joon-ho"}
        #movie = Movie.create(attributes)

        # visit "/movies/#{movie.id}"
        visit movie_path(movie.id)

        assert_text "Parasite"
        assert_text "Bong Joon-ho"
    end

    test "visiting the show page for another movie" do

        director = create(:director, name: "James Cameron")
        movie = create(:movie, title:"Titanic", director:director)

        # movie.save!
        movie = Movie.find_by(title: movie.title)
        # attributes = { title: "Titanic", director: "James Cameron" }
        # movie = Movie.create(attributes)

        # visit "/movies/#{movie.id}"
        visit movie_path(movie.id)
        
        assert_text "Titanic"
        assert_text "James Cameron"
    end

    test "visting the index page" do
        director = create(:director, name: "Bong Joon-ho")
        movie = create(:movie, title:"Parasite", director:director)
        # movie.save!
        movie = Movie.find_by(title: movie.title)
        # attributes = {title:"Parasite", director:"Bong Joon-ho"}
        # Movie.create(attributes)

        director = create(:director, name: "James Cameron")
        movie = create(:movie, title:"Titanic", director:director)
        # movie.save!
        movie = Movie.find_by(title: movie.title)
        # attributes = { title: "Titanic", director: "James Cameron" }
        # Movie.create(attributes)

        # visit "/movies"
        visit movies_path

        assert_text "Parasite"
        assert_text "Bong Joon-ho"
        assert_text "Titanic"
        assert_text "James Cameron"
    end

    # test "add new movie" do
    #     visit "/movies"
 
    #     fill_in "Title", with: "Ruby on Rails"
    #     fill_in "Director", with: "Ting"

    #     click_on "Save Movie"

    #     assert_text "Ruby on Rails"
    #     assert_text "Ting"
    # end
end