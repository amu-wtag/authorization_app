FactoryBot.define do
    factory :user do
        username { "John Doe" }
        email { "john@example.com" }
        password { "12345" }
        role { "user" }
    end
end