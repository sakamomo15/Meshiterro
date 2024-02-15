class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
    #空のモデルなので引数不要
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # current_user.id：現在ログイン中のuser.id、deviseのヘルパーメソッド
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
      #if返されたバリデーションの結果を、コントローラで検出できるようにする
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.page(params[:page])
      # .allではなくkaminari使用で1ページに指定数のデータを新しい順に取得
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
