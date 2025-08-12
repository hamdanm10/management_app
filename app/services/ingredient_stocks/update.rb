class IngredientStocks::Update < ApplicationService
  def call(ingredient_stock:, ingredient_stock_attributes:)
    ingredient_stock.assign_attributes(ingredient_stock_attributes)

    if ingredient_stock.save
      success(ingredient_stock: ingredient_stock)
    else
      failure(ingredient_stock: ingredient_stock)
    end
  end
end