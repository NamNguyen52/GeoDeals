# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :business do
    name "MyString"
    location "MyString"
    street "MyString"
    ste "MyString"
    city "MyString"
    state "MyString"
    zip 1
    country "MyString"
    lat 1.5
    lng 1.5
  end
end
