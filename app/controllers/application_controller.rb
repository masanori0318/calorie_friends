class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  before_action :require_login

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  protected

  def after_resetting_password_path_for(_resource)
    edit_user_password_path
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD'] # 環境変数を読み込む記述に変更
    end
  end

  def require_login
    # ログインが必要な処理をここに記述する
  end
end
