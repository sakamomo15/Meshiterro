class PostImage < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  # 1:Nの関係をN側から示す

end
