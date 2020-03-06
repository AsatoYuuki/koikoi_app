class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :images

  accepts_nested_attributes_for :images

  validates_associated :images

  validates :price, numericality: { only_integer: true }
  validates :name, :content, :condition, :send_cost, :send_method, :send_place, :send_day, :category_id, presence: {message: "空欄を埋めてください"}

end
