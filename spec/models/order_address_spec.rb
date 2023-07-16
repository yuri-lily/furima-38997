require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  before do
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @item.user_id, item_id: @item.id)
  end

  describe '配送先の保存' do
    context '内容に問題がない場合' do
      it '全ての値が正しい入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'address_subはからでも保存できること' do
        @order_address.address_sub = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_cadeが空では保存できないこと' do
        @order_address.postal_cade = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cade can't be blank",
        "Postal cade is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_cadeに-を含まない場合は保存できないこと' do
        @order_address.postal_cade = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cade is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idは1では保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityは空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressは空では保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberは空では保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end      
      it 'phone_numberは10字未満では保存出来ないこと' do
        @order_address.phone_number = '0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number too short")
      end
      it 'phone_numberは数字以外では保存できないこと' do
        @order_address.phone_number = 'aaaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'userが紐づいていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
