class Movie < ApplicationRecord
    belongs_to :director
    validates_presence_of :title

    enum color_format: [:color, :black_and_white]

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

    scope :most_liked, -> {order(facebook_likes: :desc).limit(1)}

    scope :by_director_name, -> (director_name) { joins(:director).where(directors: {name: director_name})}

    scope :by_plot, -> (plot) { where("plot_keywords LIKE ?", "%#{plot}%") }

    scope :join_director, -> () {joins(:director)}

    scope :director_is, -> (director_id) {where(id: director_id)}

    # used for query builder
    scope :release_year, -> (year) { where(year: "#{year}") }
    # def self.release_year(year)
    #     where(year: "#{year}")
    # end

    def self.most_liked_by_director_name_and_plot(director_name, plot)
        most_liked().
        by_director_name(director_name).
        by_plot(plot)
    end

    def self.most_liked_by_director_name_and_plot2(director_name, plot)
        order(facebook_likes: :desc).
            joins(:director).
            where(directors: {name: director_name}).
            where("plot_keywords LIKE ?", "%#{plot}%").
            first
    end
end
