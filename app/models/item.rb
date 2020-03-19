class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :images

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_associated :images

  # validates :price, numericality: { only_integer: true }
  # validates :name, :content, :condition, :send_cost, :send_method, :send_place, :send_day, :category_id, presence: {message: "空欄を埋めてください"}
  def self.create_photos_by(photo_params)
  #  そもそも一枚も上がってきてない時のためのvalidate */
  return false if photo_params[:url].nil?

#  途中でエラった時にRollbackするようにTransaction */
  Image.transaction do 

#  アップロードされた画像を一枚ずつ処理 */
    photo_params[:content].each do |photo|
      new_photo = Image.new(title: photo_params[:title], content: photo)
      return false unless new_photo.save!
    end
  end
end

  true

end
