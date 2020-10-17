class User < ApplicationRecord
  validates :nickname, presence: :true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'} do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birthday, presence: :true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end