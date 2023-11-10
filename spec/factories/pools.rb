FactoryBot.define do
  factory :pool do
    superadmin
    name { Faker::Company.name }
    start_datetime { 1.week.from_now }
    status { 0 }
    trait :public do
      private { false }
    end

    trait :private do
      private { true }
    end
  end
end
