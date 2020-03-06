class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :address, dependent: :destroy


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  
  
  
  validates :email,                 presence: true, uniqueness: true
  validates :nickname,              presence: true, length: { maximum: 10, }
  validates :family_name,             presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,            presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name_kana,        presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana,       presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birthday,              presence: true
  validates :cellphone_number,          presence: true, format: { with: VALID_PHONE_REGEX  }
end
