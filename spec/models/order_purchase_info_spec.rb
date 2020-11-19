require 'rails_helper'

RSpec.describe OrderPurchaseInfo, type: :model do
  describe '購入情報の保存' do
    before do
      @order_purchase_info = FactoryBot.build(:order_purchase_info)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_purchase_info).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @order_purchase_info.token = nil
      @order_purchase_info.valid?
      expect(@order_purchase_info.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @order_purchase_info.postal_code = nil
      @order_purchase_info.valid?
      expect(@order_purchase_info.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角数字で7桁かつ3桁目と4桁目の間に-がないと保存できないこと' do
      @order_purchase_info.postal_code = "1234567"
      @order_purchase_info.valid?
      expect(@order_purchase_info.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県が---だと保存できないこと' do
      @order_purchase_info.prefecture_id = 1
      @order_purchase_info.valid?
      expect(@order_purchase_info.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @order_purchase_info.city = nil
      @order_purchase_info.valid?
      expect(@order_purchase_info.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_purchase_info.address = nil
      @order_purchase_info.valid?
      expect(@order_purchase_info.errors.full_messages).to include("Address can't be blank")
    end
    it '建物名が空でも保存できること' do
      @order_purchase_info.building_name = nil
      expect(@order_purchase_info).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @order_purchase_info.phone_number = nil
      @order_purchase_info.valid?
      expect(@order_purchase_info.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が10もしくは11桁の半角数字でなければ保存できないこと' do
      @order_purchase_info.phone_number = "090-1234-5678"
      @order_purchase_info.valid?
      expect(@order_purchase_info.errors.full_messages).to include("Phone number is invalid. Not include hyphen(-)")
    end
  end
end
