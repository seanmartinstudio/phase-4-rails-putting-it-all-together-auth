class RecipesController < ApplicationController

    def index 
        user = User.find_by(username: params[:username])
        if session[:user_id]
            render json: Recipe.all, status: :created
        else  
            render json: { errors: ["Not Authorized"] }, status: :unauthorized
        end
    end

    def create 
        user = User.find_by(username: params[:username])
        if session[:user_id]
            recipe = user.recipes.create!(recipe_params)
            redner json: recipe, status: :created
        elsif
            
        end
    end

    private

    def recipe_params 
        params.permit(:title, :instructions, :minutes_to_complete)
    end

end
