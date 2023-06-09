require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は「7桁」の半角文字列は保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号は「3桁ハイフン4桁」の全角文字列は保存できない' do
        @order_address.post_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県を選択していないと保存できない' do
        @order_address.send_area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Send area Select')
      end

      it '市区町村が空だと保存できない' do
        @order_address.send_municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Send municipalities can't be blank")
      end

      it '番地が空だと保存できない' do
        @order_address.send_address_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Send address number can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end

      it '電話番号は、9桁以下は保存できない' do
        @order_address.tel_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is too short (minimum is 10 characters)')
      end

      it '電話番号は、12桁以上は保存できない' do
        @order_address.tel_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is too long (maximum is 11 characters)')
      end

      it '電話番号は、半角数値でないと保存できない' do
        @order_address.tel_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is invalid. Input half-width numbers')
      end

      it 'userが紐付いていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
