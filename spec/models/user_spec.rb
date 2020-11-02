require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email、password、password__confirmation、family_name、first_name、family_name_kana、family_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "family_name_kanaが全角カタカナであれば登録できる" do
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
      end
      it "family_nameが空だと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "family_name_kanaが空だと登録できない" do
      end
      it "family_name_kanaが全角カタカナ以外だと登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaが全角カタカナ以外だと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end
