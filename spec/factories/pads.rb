FactoryBot.define do
  factory :pad do
    url { "MyString" }
    agency_id { "MyString" }
    name { "MyString" }
    info_url { "MyString" }
    wiki_url { "MyString" }
    map_url { "MyString" }
    latitude { "MyString" }
    longitude { "MyString" }
    map_image { "MyString" }
    total_launch_count { 1 }
    launcher { nil }
  end
end
