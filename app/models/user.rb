class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'}
  validates :last_name, presence: true, format: { with: /\A[[ぁ-んァ-ヶ一-龥々]]+\z/, message: "Last name is invalid. Input full-width characters" }
  validates :first_name, presence: true, format: { with: /\A[[ぁ-んァ-ヶ一-龥々]]+\z/, message: "First name is invalid. Input full-width characters" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana is invalid. Input full-width katakana characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana is invalid. Input full-width katakana characters" }
  validates :birth_day, presence: true
end
