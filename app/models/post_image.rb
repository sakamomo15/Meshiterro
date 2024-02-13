class Postimage < ApplicationRecord
  
  has_one_attached :image
  # ActiveStorage を使って画像を持たせる
end
