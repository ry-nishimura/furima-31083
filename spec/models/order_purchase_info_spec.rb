require 'rails_helper'

RSpec.describe OrderPurchaseInfo, type: :model do
  describe '購入情報の保存' do
    before do
      @order_purchase_info = FactoryBot.build(:order_purchase_info)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it 'tokenが空だと保存できないこと' do
    end
    it '郵便番号が空だと保存できないこと' do
    end
    it '郵便番号が半角数字で7桁かつ3桁目と4桁目の間に-がないと保存できないこと' do
    end
    it '都道府県が---だと保存できないこと' do
    end
    it '市区町村が空だと保存できないこと' do
    end
    it '番地が空だと保存できないこと' do
    end
    it '建物名が空でも保存できること' do
    end
    it '電話番号が空だと保存できないこと' do
    end
    it '電話番号が10もしくは11桁の半角数字でなければ保存できないこと' do
    end
  end
end
