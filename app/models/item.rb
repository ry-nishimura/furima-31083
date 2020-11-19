class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_type
  belongs_to :prefecture
  belongs_to :delivery_time
  has_one :order
  has_one_attached :image

  validates :name, :explanation, :category, :condition, :shipping_fee_type, :prefecture, :delivery_time, :price, :image, presence: true
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_type_id
    validates :prefecture_id
    validates :delivery_time_id
  end
  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end