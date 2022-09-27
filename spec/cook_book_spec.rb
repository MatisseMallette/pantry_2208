require 'rspec'
require './lib/cook_book'
require './lib/recipe'

RSpec.describe CookBook do 
  before(:each) do 
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2 = Recipe.new("Cheese Burger")
    @cook_book = CookBook.new
  end

  it 'can add recipes' do 
    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)
  end
  
  it 'can return array of recipes' do 

    expect(@cook_book.recipies).to eq([])
    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)
    expect(@cook_book.recipies).to eq([@recipe1, @recipe2])
  end
end