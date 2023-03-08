class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :sheduled_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
  end

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :sheduled_day_id
  end
  
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
  validates :price, presence: true
end


