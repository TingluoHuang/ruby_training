class Movie < ApplicationRecord
    belongs_to :director
    validates_presence_of :title

    def self.titles
        Movie.pluck(:title)
    end

    def self.like
        Movie.order(facebook_likes: :desc)
    end

    def self.year_released(title)
        Movie.where(title: title).select(:year).take.year
    end

    def self.more_than_likes(likes)
        Movie.where("facebook_likes > ?", likes).count
    end

    def self.most_liked_by_director_name_and_plot(director_name, plot)
        order(facebook_likes: :desc).
            joins(:director).
            where(directors: {name: director_name}).
            where("plot_keywords LIKE ?", "%#{plot}%").
            first
    end
end
