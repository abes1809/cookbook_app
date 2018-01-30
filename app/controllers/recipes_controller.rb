class RecipesController < ApplicationController

  def index 
    
    search_term = params[:search]

    @recipes = Recipe.all 

    if search_term
      @recipes = @recipes.where("name iLIKE ?",
                               "%#{search_term}%"
                               )
    end 

    sort_attribute = params[:sort]

    if sort_attribute
      @recipes = @recipes.order(sort_attribute => :asc)
    end 
    
    render 'index.json.jbuilder'
  end 

  def create 
    recipe = Recipe.new(
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions]
                        )
    recipe.save 
    render 'show.json.jbuilder' 
  end 

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def update

    @recipe = Recipe.find(params[:id]) #finding recipe ypu want to replace

    @recipe.title = params[:title] || @recipe.title #overidding all attributes
    @recipe.chef = params[:chef] || @recipe.title
    @recipe.ingredients = params[:ingredients] || @recipe.title 
    @recipe.directions = params[:directions] || @recipe.title 
    @recipe.save

    render json: recipe.as_json #showing new object 
  end 

  def destroy 
    recipe = Recipe.find(params[:id])
    recipe.destroy 
    render json: { message: "Successfully destroyed recipe ##{recipe.id}" }
  end 

end
