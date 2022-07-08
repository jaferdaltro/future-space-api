FactoryBot.define do
  factory :configuration do
    launch_library_id { 1 }
    url { Faker::Internet.url }
    name { Faker::Name.first_name }
    family { Faker::Name.middle_name }
    full_name { Faker::Name.name_with_middle }
    variant { Faker::Name.female_first_name }
    rocket
  end
end
