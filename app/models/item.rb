class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :days

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :days_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_orequal_to:300, less_than_or_equal_to: 9_999_999 },
    presence: { message: "can't be blank"}
end
