class Devise::PasswordsController < DeviseController
  # パスワードリセットのための新しいフォームを表示するアクション
  def new
    self.resource = resource_class.new
  end

  # パスワードリセットの要求を処理するアクション
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      respond_with({}, location: after_resetting_password_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # パスワードリセットのためのフォームを表示するアクション
  def edit
    self.resource = resource_class.find_by(reset_password_token: params[:reset_password_token])
    if resource.nil?
      # リセットパスワードトークンが見つからない場合の処理
      flash[:alert] = "Invalid reset password token."
      redirect_to edit_user_password_path
    end
  end

  # パスワードを更新するアクション
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message!(:notice, flash_message)
        sign_in(resource_name, resource)
      else
        set_flash_message!(:notice, :updated_not_active)
      end
      respond_with resource, location: after_resetting_password_path_for(resource)
    else
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  # パスワードリセット後の遷移先を指定するメソッド
  def after_resetting_password_path_for(resource)
    edit_user_password_path(resource_name)
  end
end