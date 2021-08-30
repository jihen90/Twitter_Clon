class ApplicationController < ActionController::Base
    #protect_from_forgery prepend: true, with: :exception
    protect_from_forgery with: :null_session
    before_action :banned?
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def banned?
        if current_user.present? && current_user.banned?
            sign_out current_user
            flash[:notice] = 'THIS ACCOUNT HAS BEEN BANNED'
            root_path
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profilephoto])
    end

end
