FactoryBot.define do
    factory :user do
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        phone { Faker::PhoneNumber.phone_number }
        email { Faker::Internet.email }
        password { Faker::Internet.password }
        avatar_url { Faker::Avatar.image }
    end

    factory :chama do
        name { Faker::Company.name }
        reg_no { Faker::Number.number(digits: 10) }
        logo_url { Faker::Avatar.image }
        username { Faker::Internet.username }
    end

end