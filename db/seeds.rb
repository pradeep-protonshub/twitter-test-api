# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TODO - ensure that this only runs once
["Architecture", "Art", "Cars and Motorcycles", "Celebrities", "Design", "Fashion", "Technology", "Cryptocurrency", "Education", "Entertainment", "Food and Drinks", "Gardening", "Geek", "Health and Fitness", "History", "Events", "Home decor", "Outdoors", "Photography", "Science", "Nature", "Books", "Sports", "Weddings", "Travel"].sort.each do |tag|
  Interest.create(name: tag)
end