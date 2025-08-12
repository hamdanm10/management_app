class SuperAdmin::IngredientStocksController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @q = IngredientStock.includes(:unit_type).ransack(params[:q])
    @ingredient_stocks = @q.result.order(name: :asc)
    @pagy, @ingredient_stocks = pagy(@ingredient_stocks, limit:)
  end

  def show
    @ingredient_stock = ingredient_stock_scope
  end

  def new
    @ingredient_stock = IngredientStock.new
  end

  def create
    result = IngredientStocks::Create.call(ingredient_stock: ingredient_stock_params)

    if result.success?
      redirect_to new_super_admin_ingredient_stock_path, notice: "Ingredient stock successfully created."
    else
      @ingredient_stock = result.error[:ingredient_stock]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ingredient_stock = ingredient_stock_scope
  end

  def update
    result = IngredientStocks::Update.call(
      ingredient_stock: ingredient_stock_scope,
      ingredient_stock_attributes: ingredient_stock_params
    )

    if result.success?
      ingredient_stock = result.payload[:ingredient_stock]

      redirect_to edit_super_admin_ingredient_stock_path(ingredient_stock), notice: "Ingredient stock successfully updated."
    else
      @ingredient_stock = result.error[:ingredient_stock]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = IngredientStocks::Destroy.call(
      ingredient_stock: ingredient_stock_scope
    )

    redirect_to super_admin_ingredient_stocks_path, notice: "Ingredient stock successfully deleted."
  end

  private 

  def ingredient_stock_params
    params.require(:ingredient_stock).permit(:name, :quantity, :unit_type_id, :note)
  end

  def ingredient_stock_scope
    IngredientStock.includes(:unit_type).find(params[:id])
  end
end