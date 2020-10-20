require 'rails_helper'

RSpec.describe Condition, type: :model do
  it '商品の状態を選択していない場合には出品できないこと' do
    @item.condition = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
end
