# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(user_name: 'Admin',age: 40, email: 'admin@example.com',password:"123456",password_confirmation:"123456", confirmed_at: Time.now.utc, first_name: "first name test", last_name: "last name test")
Course.create(name: 'ECE444', description: 'Software Engineering')
Course.create(name: 'ECE421', description: 'Machine Learning')
Course.create(name: 'CSC384', description: 'Introduction to Artificial Intelligence')