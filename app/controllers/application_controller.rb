class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # =>deviseの機能(ユーザ登録,ログイン認証など)の使用前にconfigure_permitted_parametersメソッドが実行

  protected #privateとは違い,他のコントローラからも参照可

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録の際に,ユーザー名のデータ操作を許可
  end
end
