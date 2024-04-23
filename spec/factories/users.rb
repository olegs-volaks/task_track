FactoryBot.define do
  factory :user do
    first_name { "John" }
    sequence(:last_name) { |n| "Doe #{n}" }
    password { '123456' }
    email { "#{first_name.parameterize(separator: '_')}.#{last_name.parameterize(separator: '_')}@example.com" }
  end
end
