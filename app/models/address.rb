class Address < ApplicationRecord
  
  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  VALID_POST_REGEX = /\A\d{3}[-]\d{4}\z/
  belongs_to :user, optional: true

  validates :prefecture,            presence: true
  validates :city,                  presence: true
  validates :address,               presence: true
  validates :post_number,           presence: true
  validates :cellphone_number,          presence: true, format: { with: VALID_PHONE_REGEX  }
end
