require "application_system_test_case"

class MoviewSystemTest < ApplicationSystemTestCase
    test "visiting the show page" do
        visit '/movies/1'
        assert_text "Parasite"
        assert_text "Bong Joon-ho"
    end
end