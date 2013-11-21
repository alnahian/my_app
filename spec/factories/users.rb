# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    hashed_password "MyString"
    salt "MyString"
  end
end
