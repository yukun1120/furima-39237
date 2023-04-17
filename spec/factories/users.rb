FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    first_name {"椎名"}
    last_name {"真昼"}
    first_name_kana {"シイナ"}
    last_name_kana {"マヒル"}
    birthday {"20000202"}      
  end
end
