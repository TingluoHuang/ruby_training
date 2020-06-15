class Movie < ApplicationRecord
    validates_presence_of :title

    def self.all
        find_by_sql('SELECT * FROM "movies")
    end
end
