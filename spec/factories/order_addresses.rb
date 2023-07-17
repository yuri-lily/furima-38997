FactoryBot.define do
  factory :order_address do
    postal_cade { '123-4567' }
    prefecture_id { 2 }
    city { '東京' }
    address { '1-1' }
    address_sub { 'あああ' }
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
