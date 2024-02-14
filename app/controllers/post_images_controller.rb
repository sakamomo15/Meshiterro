class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
    #空のモデルなので引数不要
  end

  def create
    @post_image = Postimage.new(post_image_params)
    @post_image.user_id = current_user.id
    # current_user.id：現在ログイン中のuser.id、deviseのヘルパーメソッド
    @post_image.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
