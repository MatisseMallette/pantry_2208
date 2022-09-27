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


    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @cook_book = CookBook.new
  end

  it 'can add recipes' do 
    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)
  end
  
  it 'can return array of recipes' do 

    expect(@cook_book.recipes).to eq([])
    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)
    expect(@cook_book.recipes).to eq([@recipe1, @recipe2])
  end

  it 'can return an array of each unique ingredient' do 
    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)
    expect(@cook_book.ingredients).to eq([@ingredient1.name, @ingredient2.name, @ingredient3.name, @ingredient4.name])
  end

  it 'can find the highest calorie meal' do 
    @cook_book.add_recipe(@recipe1)
    @cook_book.add_recipe(@recipe2)
    expect(@cook_book.highest_calorie_meal).to eq(@recipe2)
  end
end