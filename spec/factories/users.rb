FactoryBot.define do
  factory :user do
    nickname              {Faker::Pokemon.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Name.family_name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {Faker::Name.family.katakana}
    first_name_kana       {Faker::Name.first.katakana}
    birthday              {Faker::Faker::Date.backward}
  end
end