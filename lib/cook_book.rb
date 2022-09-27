require './lib/recipe'
class CookBook
  attr_reader :recipes
  def initialize 
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.map {|recipe| recipe.ingredients}.flatten.uniq
  end

  def highest_calorie_meal 
    @recipes.max {|recipe| recipe.total_calories}
  end
end
