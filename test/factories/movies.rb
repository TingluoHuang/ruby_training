FactoryBot.define do
  factory :movie do
    title {Faker::Movie.name}
    facebook_likes { Faker::Number.within(range: 1..100000) }
    year { Faker::Number.within(range: 1990..2100) }
    plot_keywords { "#{Faker::FunnyName.name}|#{Faker::FunnyName.name}|#{Faker::FunnyName.name}" }
    director
  end
end
