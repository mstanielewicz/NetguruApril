# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: "user1@user.pl", password: "useruser1", password_confirmation: "useruser1", firstname: "John", lastname: "Smith")
user2 = User.create(email: "user2@user.pl", password: "useruser1", password_confirmation: "useruser1", firstname: "Adam", lastname: "Sandler")
user3 = User.create(email: "user3@user.pl", password: "useruser1", password_confirmation: "useruser1", firstname: "Jennifer", lastname: "Lopez")
user4 = User.create(email: "user4@user.pl", password: "useruser1", password_confirmation: "useruser1", firstname: "John", lastname: "Travolta")
user5 = User.create(email: "user5@user.pl", password: "useruser1", password_confirmation: "useruser1", firstname: "Liv", lastname: "Tyler")

admin = User.create(email: "admin@example.com", password: "useruser1", password_confirmation: "useruser1", firstname: "Best", lastname: "Admin", is_admin: true)

category = Category.create(name: "Test Category 1")

p1 = Product.create(title: "Best product ever", description: "No desc required!", price: 666.99,
                    user: admin, category: category)
p2 = Product.create(title: "Best product ever too", description: "No desc required!", price: 13.99,
                    user: admin, category: category)

Review.create(product: p1, user: user1, content: "Recenzja!", rating: 1)
Review.create(product: p1, user: user2, content: "Recenzja!", rating: 1)
Review.create(product: p1, user: user3, content: "Recenzja!", rating: 3)
Review.create(product: p1, user: user4, content: "Recenzja!", rating: 4)
Review.create(product: p1, user: user5, content: "Recenzja!", rating: 5)
Review.create(product: p2, user: user1, content: "Recenzja!", rating: 5)
Review.create(product: p2, user: user2, content: "Recenzja!", rating: 2)
Review.create(product: p2, user: user3, content: "Recenzja!", rating: 3)
Review.create(product: p2, user: user4, content: "Recenzja!", rating: 4)
Review.create(product: p2, user: user5, content: "Recenzja!", rating: 5)

