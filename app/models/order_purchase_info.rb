class OrderPurchaseInfo
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture, :city, :address, :building_name, :phone_number
  
  validates :token, presence: true
  with_options precence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, format: numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number format: { with: /^(0{1}\d{9,10})$/, message: "is invalid. Not include hyphen(-)" }
  end
  def save
    PurchaseInfo.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number)
    Order.create(user_id: user.id, item_id: item.id)
  end
end