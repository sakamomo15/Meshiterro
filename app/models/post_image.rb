class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  # アソシエーション：1:Nの関係をN側から示す

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else
      'no_image.jpg'
    end
  end
  # アクションとは少し違い、カラムのように特定の処理を名前で呼び出せる
  
end
