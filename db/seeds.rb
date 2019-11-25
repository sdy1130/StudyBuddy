# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(user_name: 'Admin', email: 'admin@example.com',password:"123456",password_confirmation:"123456", confirmed_at: Time.now.utc, first_name: "first name admin", last_name: "last name admin")
User.create(user_name: 'Test1', email: 'test1@example.com',password:"123456",password_confirmation:"123456", confirmed_at: Time.now.utc, first_name: "first name test1", last_name: "last name test1")
User.create(user_name: 'Test2', email: 'test2@example.com',password:"123456",password_confirmation:"123456", confirmed_at: Time.now.utc, first_name: "first name test2", last_name: "last name test2")

Course.create(name: 'ECE444', description: 'Software Engineering')
Course.create(name: 'ECE421', description: 'Machine Learning')
Course.create(name: 'CSC384', description: 'Introduction to Artificial Intelligence')