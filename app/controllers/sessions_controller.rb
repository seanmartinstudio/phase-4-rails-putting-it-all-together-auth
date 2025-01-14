class SessionsController < ApplicationController

    def create 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            # render json: { errors: "Not Authorized"}, status: :unauthorized
            # render json: { errors: user.errors.full_messages}, status: :unauthorized
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def destroy 
        user = User.find_by(username: params[:username])
        if session[:user_id]
            session.delete :user_id
            head :no_content
        else  
            render json: { errors: ["Not Authorized"] }, status: :unauthorized
        end
    end

end
