require './lib/ingredient'

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
end
