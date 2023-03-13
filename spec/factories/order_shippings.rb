FactoryBot.define do
  factory :order_shipping do
    postal_code       { '123-4567' }
    prefecture_id     {Faker::Number.between(from: 2, to: 48)}
    city              {'川崎市'}
    street_num        {'東枇杷島1-2-3'}
    building          {'WBCビル'}
    tel               {'00011112222'}
    token             {'tok_abcdefghijk00000000000000000'}
    
    association :user
    association :item
  end
end
