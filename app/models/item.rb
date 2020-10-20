class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliver_charge
  belongs_to_active_hash :deliver_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :prefecture
    validates :price
    validates :deliver_charge
    validates :deliver_day
  end

  validates :category_id, :condition_id, :prefecture_id, :deliver_charge_id, :deliver_day_id, numericality: { other_than: 1, only_integer: true }
  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'Out of setting range' }
  validates :price, format: { with: /\d{3,7}/, message: 'Half-width number' }
end
