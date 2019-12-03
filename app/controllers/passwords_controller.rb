class PasswordsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            random = SecureRandom.hex(5);
            @user.update(password: random, password_confirmation: random)
            redirect_to root_path, notice: "password reset successful: " + random
        else
            render :new, alert: "user not found!"
        end
    end
end
