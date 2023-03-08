FactoryBot.define do
  factory :item do
    item_name       {Faker::Lorem.sentence(10)}
    description     {Faker::Lorem.paragraph(40)}
    category_id     {Faker::Number.between(from: 2, to: 11)}
    condition_id    {Faker::Number.between(from: 2, to: 7)}
    charge_id       {Faker::Number.between(from: 2, to: 3)}
    prefecture_id   {Faker::Number.between(from: 2, to: 48)}
    days_id         {Faker::Number.between(from: 2, to: 4)}
    price           {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
