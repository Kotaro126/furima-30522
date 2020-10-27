class User < ApplicationRecord
  has_many :items
  has_many :orders
  has_one :card, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください' }
    validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カタカナを使用してください' }
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
