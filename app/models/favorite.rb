class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_image
  
  validates :user_id, uniqueness: {scope: :post_image_id}
  # uniquness:validatesの引数(user_id)が重複していないかをチェック
  # scope:user_idとpost_image_idのペアに対して重複していないかをチェック
end
