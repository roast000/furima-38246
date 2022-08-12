require 'rails_helper'

RSpec.describe OrderOrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @address = FactoryBot.build(:order_order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address.post_code = '9811111'
        @address.valid?
        expect(@address.errors.full_messages).to include "Post code is invalid"
      end
      it 'prefectureを選択していないと保存できないこと' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Post code can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと保存できないこと' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空だと保存できないこと' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが半角数字以外だと保存できないこと' do
        @address.phone_number = '０００１１１１１１１１'
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberが半角数字以外だと保存できないこと' do
        @address.phone_number = '000-1111-1111'
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'userとitemが紐付いていないと保存できないこと' do
        @address.user_id = nil
        @address.item_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end