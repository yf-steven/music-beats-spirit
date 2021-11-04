FactoryBot.define do
  factory :like do
    association :user
    association :report
  end
end
