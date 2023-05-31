require 'faker'
require 'faker/japanese'
FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Faker::Japanese::Name.first_name }
    last_name             { Faker::Japanese::Name.last_name }
    kana_first_name       { person.first.katakana }
    kana_last_name        { person.last.katakana }
    date_birth            { Faker::Date.birthday }
  end
end
