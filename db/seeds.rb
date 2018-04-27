# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(first_name:  "Shannon",
	         last_name:   "McMurtrey",
	         admin:       true,
	         super_user:  true,
	         social_worker: true,
             email: "smcmurtrey@drury.edu",
             password:              "password")

User.create!(first_name:  "Eric",
	         last_name:   "McCoullough",
	         admin:       true,
	         super_user:  true,
	         social_worker: true,
             email: "eric96@live.missouristate.edu",
             password:              "password")
