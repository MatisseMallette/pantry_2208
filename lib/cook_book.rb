require './lib/recipe'
class CookBook
  attr_reader :recipies
  def initialize 
    @recipies = []
  end

  def add_recipe(recipe)
    @recipies << recipe
  end
end
