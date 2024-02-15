Rails.application.routes.draw do
  devise_for :users #devise を使用する際に URL として users を含む
  root to: 'homes#top'
  get 'homes/about', as: 'about' #get "/homes/about" => "homes#about", as: "about"??
  # 名前付きルートをas:で設定
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    # resource(単数形)だとURLに/:idが含まれない <= 1投稿1いいねなのでユーザーidとpost_image_idが分かれば良い
    # resourc：それ自身のidが分からなくても、関連する他のモデルのidから特定できる場合に
    resources :post_comments, only: [:create, :destroy]
  end
    # 投稿画像に対してコメントされる => post_commentsとpost_imagesは親子関係(ネスト) => ネストしたURL： /post_images/:post_image_id/post_comments(.:format)
    
  resources :users, only: [:show, :edit, :update]
    # 不要なルーティングが実行されないようにonlyを設定
end
