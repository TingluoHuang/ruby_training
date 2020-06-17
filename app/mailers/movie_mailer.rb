class MovieMailer < ApplicationMailer

    default from: 'from@example.com'

    def new_movie_email
        @movie = params[:movie]
        mail(to: "to@example.com", subject: "New movie created: #{@movie.title}")
    end
end
