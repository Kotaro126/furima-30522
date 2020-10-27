class UserOrder
  # attr_accessorで保存したいorders/addressesテーブルのカラム名全て指定し、Formオブジェクトのインスタンスを生成した際にform_withの引数として利用できる
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone, :user_id, :item_id, :order_id, :token
  validates :token, presence: true

  # バリデーションを以下に記述する
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone, format: { with: /\A[0-9]{11}+\z/, message: 'is invalid. 半角数字を使用してください' }
    validates :city, :block
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # order/addressテーブルにデータ保存する処理を記述する
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, order_id: order.id)
  end
end
