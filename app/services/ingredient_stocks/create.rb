class IngredientStocks::Create < ApplicationService
  def call(ingredient_stock:)
    ingredient_stock = IngredientStock.new(ingredient_stock)

    if ingredient_stock.save
      success(ingredient_stock: ingredient_stock)
    else
      failure(ingredient_stock: ingredient_stock)
    end
  end
end