# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# frozen_string_literal: true

(1..10).each do |number|
  User.find_or_create_by(email: "user#{number}@email.com") do |user|
    user.name = 'Jane Doe'
    user.password = 'password'
  end
end
