class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # deviseの機能5つ
  
  has_many :post_images, dependent: :destroy
  # 1:Nの関係を1側から示す, 1:Nの1側が削除されるとN側を全て削除
end
