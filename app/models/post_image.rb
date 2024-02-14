class Postimage < ApplicationRecord
  
  has_one_attached :image
  # ActiveStorage を使って画像を持たせる
  
  belongs_to :user
  # 1:Nの関係をN側から示す
end
