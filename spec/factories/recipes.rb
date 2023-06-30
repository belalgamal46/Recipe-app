FactoryBot.define do
  factory :recipe do
    name { 'Recipe Name' }
    preparation_time { 30 }
    cooking_time { 60 }
    description { 'Recipe Description' }
    public { true }
    user { association :user }
  end
end
