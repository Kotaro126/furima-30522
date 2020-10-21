require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいく場合' do
      it 'すべての情報が正しく入力されている場合は出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかない場合' do
      it '画像が空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がない場合には出品できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '商品の販売価格を入力していない場合出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数字の場合出品できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '価格が299円以下の場合出品できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が10000000円以上の場合出品できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格が漢字平仮名の場合出品できないこと' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '価格が英字の場合出品できないこと' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '商品の状態が空では出品できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品のカテゴリーが空では出品できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '配送料の負担に関する情報が空では出品できないこと' do
        @item.deliver_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver charge can't be blank")
      end
      it '発送元の地域に関する情報が空では出品できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送にかかる日数が空では出品できないこと' do
        @item.deliver_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver day can't be blank")
      end
    end
  end
end
