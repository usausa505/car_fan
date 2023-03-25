# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected


  def after_sign_in_path_for(resource)
    if current_user
      root_path  #　指定したいパスに変更
    elsif current_admin
      admin_root_path
    else
      uses_my_page_path  #　指定したいパスに変更
    end
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
