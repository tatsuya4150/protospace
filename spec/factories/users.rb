FactoryGirl.define do

  factory :user do
    name                      { Faker::Name.name  }
    email                     { Faker::Internet.email }
    member                    { Faker::Company.name  }
    works                     { Faker::App.name }
    profile                   { Faker::Lorem.sentence }
    password                  "1234567890"
    password_confirmation     "1234567890"
  end
end
