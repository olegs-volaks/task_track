FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }
    sequence(:description) { |n| "Task description #{n}" }
    deadline { DateTime.current.next_day }

    association :created_by, factory: :user
    association :assigned_to, factory: :user
  end
end
