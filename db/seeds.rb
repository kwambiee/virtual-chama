# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

5.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password'
    )
end

2.times do
    Chama.create!(
        name: Faker::Company.name,
        reg_no: Faker::Number.number(digits: 10),
        username: Faker::Internet.username,
        logo_url: Faker::Company.logo,
        user_id: User.all.sample.id
    )
end

5.times do
    ChamaMembership.create!(
        user_id: User.all.sample.id,
        chama_id: Chama.all.sample.id
    )
end




