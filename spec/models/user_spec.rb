require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "すべての項目が適切に存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "aaa111"
        @user.password_confirmation = "bbb222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数字混合' do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "testemail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '名前全角のfirst_nameが空' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前全角のlast_nameが空' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前全角のfirst_nameに全角以外の文字が含まれる' do
        @user.first_name = "椎名shi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it '名前全角のlast_name全角以外の文字が含まれる' do
        @user.last_name = "椎名shi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '名前全角カナのfirst_nameが空' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名前カナのlast_nameが空' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前全角カナのfirst_nameに全角以外の文字が含まれる' do
        @user.first_name_kana = "シイナ椎名"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '名前全角カナのlast_name全角以外の文字が含まれる' do
        @user.last_name_kana = "シイナ椎名"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '生年月日が空' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
