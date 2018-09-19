class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseを利用する機能（ユーザ登録、ログイン認証など）が実行される前に、configure_permitted_parametersが実行される

  def after_sign_in_path_for(resource)
		user_path (current_user.id)
	end

	def after_sign_out_path_for(resource)
		new_user_session_path
	end

 protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
  # configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されている。
  # 今回の場合、ユーザ登録(sign_up)の際、ユーザ名(name)のデータ操作が許可されることになる。
  # ストロングパラメータと同様。
  # privateは自分のコントローラ内でしか参照できないが、protectedは呼び出された他のコントローラからも参照ができるストロングパラメータとなる。

end
