class IngredientStocks::Destroy < ApplicationService
  def call(ingredient_stock:)
    if ingredient_stock.destroy
      success(ingredient_stock: ingredient_stock)
    else
      failure(ingredient_stock: ingredient_stock)
    end
  end
end