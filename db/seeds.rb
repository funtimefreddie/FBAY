# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Category.count == 0
  Category.create(name: "Food/drink")
  Category.create(name: "Weapons")
  Category.create(name: "Vehicles")
  Category.create(name: "Technology")
  Category.create(name: "Household")
  Category.create(name: "People")
  Category.create(name: "Misc")
end


Bid.create(user_id: 13, item_id: 21, amount: 5)
Bid.create(user_id: 13, item_id: 22, amount: 5)

