class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :count_djset_without_response


    def count_djset_without_response
      @djsets = Djset.all.order('created_at DESC')
      puts "___________________________________________________________________________________"
      @pending_dj_set = @djsets.select { |fuck| fuck.confirmdjset == nil }
      puts @pending_dj_set.count
      @djset_request_pending = @pending_dj_set.count
      puts "_____________________________________________________________________________________"
    end

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation)}
  end
end
