FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { 'あああ' }
    first_name            { 'いいい' }
    last_name_kana        { 'アアア' }
    first_name_kana       { 'イイイ' }
    birth_date            { '1930-01-01' }
  end
end
