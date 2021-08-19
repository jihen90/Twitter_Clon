class ApplicationController < ActionController::Base
    before_action :sign_up_config, if: :devise_controller?
    before_action :user_update_config, if: :devise_controller?


    def sign_up_config
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profilephoto])
    end

    def user_update_config
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profilephoto])
    end

end
