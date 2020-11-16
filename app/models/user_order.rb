class UserOrder
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture, :city, :address, :building_name, :phone_number
  
end