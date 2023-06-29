FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password123' }
    # Add any other attributes you need for the User model
  end
end
