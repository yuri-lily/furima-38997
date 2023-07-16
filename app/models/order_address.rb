class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_cade, :prefecture_id, :city, :address, :address_sub, :phone_number,:token

  with_options presence: true do
    validates :token
    validates :postal_cade, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number,format: {with: /\A[0-9]{10,11}\z/, message: "too short"}, numericality: {only_integer: true, message: "is invalid. Input only number"}
    validates :user_id
    validates :item_id 
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cade: postal_cade, prefecture_id: prefecture_id, city: city, address: address, address_sub: address_sub, phone_number: phone_number, order_id: order.id)
  end

end