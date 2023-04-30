FactoryBot.define do
  factory :order_address do
    post_code {"123-4567"}
    region_id {2}
    municipality {"横浜市青葉区"}
    number {"青葉台5−1"}
    building {"青葉ビル"}
    telephone {"09022222222"}
    user_id {2}
    item_id {2}
    token {Faker::Alphanumeric.alpha(number: 20)}
  end
end
