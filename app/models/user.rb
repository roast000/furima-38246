class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Last name is invalid. Input full-width characters" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "First name is invalid. Input full-width characters" }
  validates :last_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Last name kana is invalid. Input full-width katakana characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "First name kana is invalid. Input full-width katakana characters" }
  validates :birth_day, presence: true
end
