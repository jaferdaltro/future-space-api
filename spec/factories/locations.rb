FactoryBot.define do
  factory :location do
    url { Faker::Internet.url }
    name { "MyString" }
    country_code { "MyString" }
    map_image { "MyString" }
    total_launch_count { 1 }
    total_landing_count { 1 }
    pad { nil }
  end
end
