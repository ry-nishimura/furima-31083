class OrderPurchaseInfo
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id
  
  validates :token, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Not include hyphen(-)" }
  end
  def save
    PurchaseInfo.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
    Order.create(user_id: user_id, item_id: item_id)
  end
end