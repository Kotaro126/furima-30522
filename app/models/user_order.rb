class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone, :user_id, :item_id, :token, :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'が有効ではありません.ハイフンを含めた半角数字を記入して下さい.' }
    validates :phone, format: { with: /\A[0-9]{11}+\z/, message: 'が有効ではありません.半角数字を使用してください.' }
    validates :city, :block
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, order_id: order.id)
  end
end
