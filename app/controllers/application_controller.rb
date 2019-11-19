class ApplicationController < ActionController::Base
    # Generalize login and logout actions by calling in Application Controller
    private
    
    def authenticate
        unless current_user
            redirect_to "/login", alert: "Invalid Request"
            session[:return_to] = request.url
        end
    end
    
    # Generalized login action
    def login(user)
        session[:user_id] = user.id
    end
    
    # Generalized logout action
    def logout
        session[:user_id] = nil
    end
    
    # Find Current user
    def current_user
        @current_user ||= User.find session[:user_id] if session[:user_id]
    end
    helper_method :current_user
end
