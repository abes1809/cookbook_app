json.array! @recipes.each do |recipe|
  json.id recipe.id 
  json.title recipe.title 
  json.chef recipe.chef
  json.ingredients recipe.ingredients
  json.directions recipe.directions 
  json.image_url recipe.image_url 
  json.prep_time recipe.prep_time
  json.created_at recipe.created_at 
  json.updated_at recipe.updated_at
end 

