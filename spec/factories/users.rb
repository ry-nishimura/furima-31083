FactoryBot.define do
  factory :user do
    nickname              {Faker::Artist.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    family_name           {"鈴木"}
    first_name            {"一朗"}
    family_name_kana      {"スズキ"}
    first_name_kana       {"イチロウ"}
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end