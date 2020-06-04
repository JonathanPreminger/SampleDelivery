class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :count_djset_without_response, :request_count_for_display

  def count_djset_without_response
    @djsets = Djset.all.order('created_at DESC')
    @pending_dj_set = @djsets.select { |i| i.confirmdjset == nil }
    @djset_request_pending = @pending_dj_set.count
  end

  def request_count_for_display
    if @djset_request_pending > 0
      @superior_to_0 = true
    elsif @djset_request_pending > 9
      @superior_to_9 = true
    end
  end


  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation)}
  end
end
