require './lib/recipe'
class CookBook
  attr_reader :recipies
  def initialize 
    @recipies = []
  end

  def add_recipe(recipe)
    @recipies << recipe
  end

  def ingredients
    @recipies.map {|recipe| recipe.ingredients}.flatten.uniq
  end

  def highest_calorie_meal 
    @recipies.max {|recipe| recipe.total_calories}
  end
end
