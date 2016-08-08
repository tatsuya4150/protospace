FactoryGirl.define do
  factory :prototype do
    title                     { Faker::Name.name }
    catch_copy                { Faker::Company.catch_phrase }
    concept                   { Faker::Company.catch_phrase }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    user

    trait :with_comments do
      transient do
        comments_count 5
      end
      after(:create) do |product, evaluator|
        evaluator.comments_count.times do
          product.comments.create(text: 'text')
        end
      end
    end
    trait :with_likes do
      transient do
        likes_count 5
      end
      after(:create) do |product, evaluator|
        evaluator.likes_count.times do
          product.likes.create
        end
      end
    end
  end
end
