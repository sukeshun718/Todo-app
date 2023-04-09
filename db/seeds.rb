# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

emma = User.create!(email: 'emma@sample.com', password:'password')
minami = User.create!(email: 'minami@sample.com', password:'password')

5.times do
    emma.boards.create!(
        name: Faker::Lorem.sentence(word_count: 3),
        description: Faker::Lorem.sentence(word_count: 7)
        )
end

5.times do
    minami.boards.create!(
        name: Faker::Lorem.sentence(word_count: 3),
        description: Faker::Lorem.sentence(word_count: 7)
        )
end