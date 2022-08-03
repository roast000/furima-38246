require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '登録ができる時' do
      it "全ての項目の入力が存在すれば登録できること" do 
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ半角英数字混合であれば登録できること' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end
    context '登録ができない時' do
      #新規登録/ユーザー情報
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でなければ登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      #新規登録/本人情報確認
      it 'last_nameは、名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it 'first_nameは、名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it 'last_name_kanaは空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end
      it 'first_name_kanaは、空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end
      it 'last_nameは、名字が全角でなければ登録できない' do
        @user.last_name = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name Last name is invalid. Input full-width characters")
      end
      it 'first_nameは、名前が全角でなければ登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name First name is invalid. Input full-width characters")
      end
      it 'last_name_kanaは、名字が全角カナでなければ登録できない' do
        @user.last_name_kana = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana Last name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaは、名前が全角カナでなければ登録できない' do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana First name kana is invalid. Input full-width katakana characters")
      end
      it '生年月日がなければ登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birth day can't be blank")
      end
   end
  end
end
