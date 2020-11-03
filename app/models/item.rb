class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_type
  belongs_to :prefecture
  belongs_to :delivery_time
  has_one_attached :image

  validates :name, :explanation, :category, :condition, :shipping_fee_type, :prefecture, :delivery_time, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_fee_type, numericality: { other_than: 1 }
  validates :prefecture, numericality: { other_than: 1 }
  validates :delivery_time, numericality: {other_than: 1 }
end