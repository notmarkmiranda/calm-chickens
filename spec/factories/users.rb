FactoryBot.define do
  factory :user, aliases: [:superadmin] do
    sequence(:email) { |n| "test#{n}@example.com" }
    password_digest { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nickname { Faker::Superhero.name }
  end
end
