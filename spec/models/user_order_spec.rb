require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入機能' do
    context '商品の購入記録の保存がうまくいく場合' do
      it '全ての値が入力されていれば保存できる' do
        expect(@user_order).to be_valid
      end
      it 'buildingが入力されていない場合でも保存できる' do
        @user_order.building = nil
        @user_order.valid?
        expect(@user_order).to be_valid
      end
    end

    context '購入記録の保存がうまくいかない場合' do
      it 'tokenが空だと保存できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていない場合保存できない' do
        @user_order.postal_code = '1111111'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code が有効ではありません.ハイフンを含めた半角数字を記入して下さい.')
      end
      it 'postal_codeが全角数字では保存できないこと' do
        @user_order.postal_code = '１１１１１１１'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code が有効ではありません.ハイフンを含めた半角数字を記入して下さい.')
      end
      it 'postal_codeが平仮名の場合は保存できないこと' do
        @user_order.postal_code = 'あああああああ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code が有効ではありません.ハイフンを含めた半角数字を記入して下さい.')
      end
      it 'postal_codeが漢字の場合は保存できないこと' do
        @user_order.postal_code = '郵便番号'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code が有効ではありません.ハイフンを含めた半角数字を記入して下さい.')
      end
      it 'postal_codeが全角カタカナの場合は保存できないこと' do
        @user_order.postal_code = 'アアアアアアア'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code が有効ではありません.ハイフンを含めた半角数字を記入して下さい.')
      end
      it 'postal_codeが半角カタカナの場合は保存できないこと' do
        @user_order.postal_code = 'ｱｱｱｱｱｱｱ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code が有効ではありません.ハイフンを含めた半角数字を記入して下さい.')
      end
      it 'postal_codeが半角英字の場合は保存できないこと' do
        @user_order.postal_code = 'postalcode'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code が有効ではありません.ハイフンを含めた半角数字を記入して下さい.')
      end
      it 'postal_codeが全角英字の場合は保存できないこと' do
        @user_order.postal_code = 'ｐｏｓｔａｌｃｏｄｅ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code が有効ではありません.ハイフンを含めた半角数字を記入して下さい.')
      end
      it 'prefecture_idが空だと保存できない' do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0だと保存できない' do
        @user_order.prefecture_id = '0'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できない' do
        @user_order.block = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Block can't be blank")
      end
      it 'phoneが空だと保存できない' do
        @user_order.phone = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが全角数字では登録できないこと' do
        @user_order.phone = '１１１１１１１１１１１'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
      it 'phoneが平仮名の場合は登録できないこと' do
        @user_order.phone = 'あああ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
      it 'phoneが漢字の場合は登録できないこと' do
        @user_order.phone = '電話番号'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
      it 'phoneが全角カタカナの場合は登録できないこと' do
        @user_order.phone = 'アアア'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
      it 'phoneが半角カタカナの場合は登録できないこと' do
        @user_order.phone = 'ｱｱｱ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
      it 'phoneが半角英字の場合は登録できないこと' do
        @user_order.phone = 'phone'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
      it 'phoneが全角英字の場合は登録できないこと' do
        @user_order.phone = 'ｐｈｏｎｅ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
      it 'phoneが11桁以上の数字では登録できないこと' do
        @user_order.phone = '000000000000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
      it 'phoneにハイフンが含まれる場合は登録できないこと' do
        @user_order.phone = '111-1111-1111'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone が有効ではありません.半角数字を使用してください.')
      end
    end
  end
end
