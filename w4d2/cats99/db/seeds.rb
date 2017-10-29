# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
COLORS = %W[calico black white brown]


4.times do
  Cat.create(birth_date: Faker::Date.birthday(2, 10),
             color: COLORS.sample,
             name: Faker::Cat.name,
             sex: ['M', 'F'].sample,
             description: Faker::MostInterestingManInTheWorld.quote)
end


CatRentalRequest.create(cat_id: 6,
                        start_date: Date.new(2018, 10, 1),
                        end_date: Date.new(2018, 10, 3),
                        status: 'APPROVED')

CatRentalRequest.create(cat_id: 6,
                        start_date: Date.new(2018, 10, 6),
                        end_date: Date.new(2018, 10, 9),
                        status: 'APPROVED')

CatRentalRequest.create(cat_id: 6,
                        start_date: Date.new(2017, 11, 5),
                        end_date: Date.new(2017, 11, 5),
                        status: 'APPROVED')

CatRentalRequest.create(cat_id: 6,
                        start_date: Date.new(2017, 11, 1),
                        end_date: Date.new(2017, 11, 1),
                        status: 'APPROVED')
