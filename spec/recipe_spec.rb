require 'rspec'
require './lib/recipe'

RSpec.describe Recipe do
  before(:each) do 
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
  end

  it 'has readable attributes' do 
    expect(@recipe1.name).to eq("Mac and Cheese")
  end

  it 'can have ingredients added' do 
    
    expect(@recipe1.ingredients).to eq([@ingredient1, @ingredient2])
  end

  it 'can return the required ingredients' do 
    expect(@recipe1.ingredients_required).to eq({@ingredient1 => 6, @ingredient2 => 8})
  end

  it 'can return total calories' do 
    expect(@recipe1.total_calories).to eq(840)
  end
end