require 'rspec'
require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do 
  before(:each) do 
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end

  it 'has readable attributes' do 
    expect(@pantry.stock).to eq({})
  end

  it 'has can return the stock of a specific item' do 
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it 'can restock ingredients' do 
    @pantry.restock(@ingredient1, 5)
    expect(@pantry.stock_check(@ingredient1)).to eq(5)
    @pantry.restock(@ingredient1, 10)
    expect(@pantry.stock_check(@ingredient1)).to eq(15)
    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end

  it 'can determine if there are sufficient ingredients to make a meal' do 
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 6)
    @recipe1.add_ingredient(@ingredient2, 8)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
    @pantry.restock(@ingredient1, 6)
    @pantry.restock(@ingredient2, 8)
    expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
  end
end