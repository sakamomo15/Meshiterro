class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # deviseの機能5つ

  has_many :post_images, dependent: :destroy
    # 1:Nの関係を1側から示す, 1:Nの1側が削除されるとN側を全て削除
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :profile_image
    # profile_imageという名前でActiveStorageでプロフィール画像を保存できるように設定

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
    # get_profile_image(100, 100) => 100x100の画像にリサイズ
  
end
