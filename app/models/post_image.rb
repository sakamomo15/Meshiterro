class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  # アソシエーション：1:Nの関係をN側から示す
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image # アクションとは少し違い、カラムのように特定の処理を名前で呼び出せる
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
    # =>画像ない時：app/assets/imagesの中のno_image.jpgをデフォとしてActiveStorageに格納し、それを表示
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
    # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうか調べる
  
end
