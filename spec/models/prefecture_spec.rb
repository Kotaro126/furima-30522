require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  it '発送元の地域を選択していない場合出品できないこと' do
    @item.prefecture = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end
end
