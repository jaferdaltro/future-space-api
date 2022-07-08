FactoryBot.define do
  factory :launch_service_provider do
    url { Faker::Internet.url }
    name { Faker::Name.first_name }
    type { Faker::Dessert.variety }
    launcher
  end
end
