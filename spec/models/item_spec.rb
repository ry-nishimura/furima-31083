require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品が出品できる場合" do
      it "入力必須項目が全て埋まっていれば、出品できる" do
      end
    end
    context "商品が出品できない場合" do
      it "画像がないと出品できない" do
      end
      it "商品名がないと保存できない" do
      end
      it "商品説明がないと保存できない" do
      end
      it "商品のカテゴリーが---だと保存できない" do
      end
      it "商品の状態が---だと保存できない" do
      end
      it "配送料の負担が---だと保存できない" do
      end
      it "発送元の地域が---だと保存できない" do
      end
      it "発送までの日数が---だと保存できない" do
      end
      it "価格がないと保存できない" do
      end
      it "価格があっても、300円未満だと保存できない" do
      end
      it "価格があっても、10M円以上だと保存できない" do
      end
    end
  end
end
