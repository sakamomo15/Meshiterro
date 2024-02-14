class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  # アソシエーション：1:Nの関係をN側から示す

  def get_image # アクションとは少し違い、カラムのように特定の処理を名前で呼び出せる
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
# =>画像が設定されない場合はapp/assets/imagesの中のno_image.jpgをデフォルト画像としてActiveStorageに格納し、それを表示
  
end
