require 'rails_helper'

RSpec.describe DeliverCharge, type: :model do
  it '配送料の負担についての情報を入力していない場合出品できないこと' do
    @item.deliver_charge = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Deliver charge can't be blank")
  end
end
