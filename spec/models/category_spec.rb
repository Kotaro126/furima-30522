require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'カテゴリーを選択していない場合には出品できないこと' do
    @item.category = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
end
