require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

  end

  describe '商品出品登録' do

    context '出品成功する場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録に失敗する場合' do
      it '商品名が空だと登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーの情報が空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '配送料負担の情報が空だと登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end

      it '発送元の地域が空だと登録できない' do
        @item.send_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Send area can't be blank"
      end

      it '発送までの日数が空だと登録できない' do
        @item.sender_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Sender day can't be blank"
      end

      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '299円以下は登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price should be between 300 and 9999999"
      end

      it '10000000円以上は登録できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price should be between 300 and 9999999"
      end

      it '価格は半角数値でしか登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price should be between 300 and 9999999"
      end


    end
  end
end
