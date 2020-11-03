require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email、password、password__confirmation、family_name、first_name、family_name_kana、family_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.nickname = "000000"
        expect(@user).to be_valid
      end
      it "family_nameが全角文字であれば登録できる" do
        @user.family_name = "鈴木"
        expect(@user).to be_valid
      end
      it "first_nameが全角文字であれば登録できる" do
        @user.first_name = "一朗"
        expect(@user).to be_valid
      end
      it "family_name_kanaが全角カタカナであれば登録できる" do
        @user.family_name_kana = "スズキ"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
        @user.first_name_kana = "イチロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@マークが含まれていなければ登録できない" do
        @user.email = 'aaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英数字混合でなければ登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameが全角文字でなければ登録できない" do
        @user.family_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角文字でなければ登録できない" do
        @user.first_name = 'ｲﾁﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kanaが全角カタカナ以外だと登録できない" do
        @user.family_name_kana = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが全角カタカナ以外だと登録できない" do
        @user.first_name_kana = 'ｲﾁﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
