class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_num, :building, :tel, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: { other_than: 1 ,message: "can't be blank"}
    validates :city
    validates :street_num
    validates :tel, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}
    validates :user_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_num: street_num, building: building, tel: tel, order_id: order.id)
  end

end