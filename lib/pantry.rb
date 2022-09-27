require './lib/ingredient'
require './lib/recipe'

class Pantry
  attr_reader :stock 
  def initialize
    @stock = Hash.new { |hash, key| hash[key] = 0}
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount 
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.none? { |ingredient, amount| @stock[ingredient] < amount }
  end
end
