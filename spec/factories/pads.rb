FactoryBot.define do
  factory :pad do
    url { "MyString" }
    agency_id { "MyString" }
    name { Faker::Name.name }
    info_url { Faker::Internet.url }
    wiki_url { Faker::Internet.url }
    map_url { Faker::Internet.url }
    latitude { "MyString" }
    longitude { "MyString" }
    map_image { "MyString" }
    total_launch_count { 1 }
    launcher { nil }
  end
end
