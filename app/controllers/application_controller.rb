class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
#許可されたパラメーターを構成する= before_action :configure_permitted_parameters,
# if: :devise_controller?はその戻り値がtrueであったときにのみ処理を実行するよう設定するものです。
#今回は:devise_controller?というdeviseのヘルパーメソッド名を指定して、もしdeviseに関するコントローラーの処理であれば、
#そのときだけconfigure_permitted_parametersメソッドを実行するように設定しています。他のtweetsコントローラーなどでは処理は読み込まれても、実行まではされません。
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end