class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture, :city, :address, :building_name, :phone_number
  
  validates :token, presence: true
  with_options precence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  end
end