class Director < ApplicationRecord
    #validates_presence_of :name
    has_many :movies
    # def self.titles
    #     Movie.pluck(:title)
    # end

    # def self.like
    #     Movie.order(facebook_likes: :desc)
    # end

    # def self.year_released(title)
    #     Movie.where(title: title).select(:year).take.year
    # end

    # def self.more_than_likes(likes)
    #     Movie.where("facebook_likes > ?", likes).count
    # end

    scope :by_name, -> (director_name) { where(name: director_name) }
end
