class MovieMailer < ApplicationMailer

    default from: 'from@example.com'

    def new_movie_email
        @title = params[:title]
        @director = params[:director]
        mail(to: "to@example.com", subject: "New movie created: #{@title}")
    end
end
