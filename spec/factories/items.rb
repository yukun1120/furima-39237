FactoryBot.define do
  factory :item do
    name {"あ" * 40 }
    explanation {"あ" * 1000}
    category_id {2}
    status_id {2}
    postage_id {2}
    region_id {2}
    schedule_id {2}
    price {1000} 
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
