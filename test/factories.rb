FactoryBot.define do
    factory :user do |f|
        f.sequence(:name){ |n| "TestUser #{n}" }
        f.sequence(:email){ |n| "test#{n}@account.com" }
        f.password{ "password" }
        f.password_confirmation{ |d| d.password }
        
    end
    
    factory :square do |f|
        f.sequence(:name) { |n| "Square #{n}" }
        f.detail { "Square Automation test" }
        f.association :user
    end
end