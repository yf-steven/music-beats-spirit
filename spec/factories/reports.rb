FactoryBot.define do
  factory :report do
    title {Faker::Lorem.word}
    artist {Faker::Name.name}
    text {Faker::Lorem.sentence}
    violent {'2.5'}
    with_family {'2.5'}
    preparation {'3'}
    association :user
  end
end
