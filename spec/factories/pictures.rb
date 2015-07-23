FactoryGirl.define do
  factory :picture do
    title { Faker::Company.name }
    description { Faker::Lorem.sentence }
		url { Faker::Internet.url }
		author
  end
end
