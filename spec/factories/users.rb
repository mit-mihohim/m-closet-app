FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@testmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end
end