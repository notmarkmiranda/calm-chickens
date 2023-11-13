FactoryBot.define do
  factory :membership do
    user
    pool
    role { 0 }
    status { 0 }
  end
end
