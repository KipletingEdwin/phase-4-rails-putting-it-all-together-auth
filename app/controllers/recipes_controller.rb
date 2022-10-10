class RecipesController < ApplicationController 
   
    
    def index
        recipe = Recipe.find_by(id: session[:user_id]) 
        if recipe 
            render json: recipe, status: :created 
        else 
            render json: { errors: "a kind of Array" }, status: :unauthorized  
        end

    end


    def create 
        recipe = Recipe.create(recipe_params) 
        if recipe.valid? 
            session[:user_id] = user.id 
            render json: recipe, status: :created 
        else 
            render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
        end
    end 
    

    def recipe_params 
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
