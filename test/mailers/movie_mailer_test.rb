require 'test_helper'

class MovieMailerTest < ActionMailer::TestCase
  test "the new movie email tells us about a new movie" do
    movie = create(:movie)

    email = MovieMailer.with(title: movie.title, director: movie.director.name).new_movie_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['to@example.com'], email.to
    assert_equal ['from@example.com'], email.from
    assert_match /#{movie.title}/, email.subject
    assert_match /#{movie.title}/, email.body.to_s
    assert_match /#{movie.director.name}/, email.body.to_s
  end
  # test "the truth" do
  #   assert true
  # end
end
