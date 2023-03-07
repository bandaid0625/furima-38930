class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :days

  with_options presence: true do
    validates :image, presence: true
    validates :item_name, presence: true
    validates :description, presence: true
  end

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id, presence: true
    validates :condition_id, presence: true
    validates :charge_id, presence: true
    validates :prefecture_id, presence: true
    validates :days_id, presence: true
  end
  
  validates :price, numericality: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
  validates :price, presence: true
end


