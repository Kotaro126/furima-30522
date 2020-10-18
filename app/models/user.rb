class User < ApplicationRecord
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用してください'} do
    validates :first_name_kana
    validates :last_name_kana
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
