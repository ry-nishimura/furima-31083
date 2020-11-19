class Order < ApplicationRecord
  has_one :purchase_info
  belongs_to :user
  belongs_to :item
end
