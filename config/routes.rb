Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users #devise を使用する際に URL として users を含む
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # 不要なルーティングが実行されないようにonlyを設定
  
  resources :users, only: [:show, :edit]
  
  get 'homes/about', as: 'about' #get "/homes/about" => "homes#about", as: "about"??
  # 名前付きルートをas:で設定
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
