require 'rails_helper'

RSpec.describe DeliverDay, type: :model do
  it '配送にかかる日数についての情報を入力していない場合出品できないこと' do
    @item.deliver_day = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Deliver day can't be blank")
  end
end
