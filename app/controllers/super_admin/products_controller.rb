class SuperAdmin::ProductsController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @q = Product.ransack(params[:q])
    @products = @q.result.order(name: :asc)
    @pagy, @products = pagy(@products, limit:)
  end

  def new
    @product = Product.new
  end

  def create
    result = Products::Create.call(product: product_params)

    if result.success?
      redirect_to new_super_admin_product_path, notice: "Product successfully created."
    else
      @product = result.error[:product]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = product_scope
  end

  def update
    result = Products::Update.call(
      product: product_scope,
      product_attributes: product_params
    )

    if result.success?
      product = result.payload[:product]

      redirect_to edit_super_admin_product_path(product), notice: "Product successfully updated."
    else
      @product = result.error[:product]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = Products::Destroy.call(
      product: product_scope
    )

    redirect_to super_admin_products_path, notice: "Product successfully deleted."
  end

  private

  def product_params
    params.require(:product).permit(:name, :cost_price, :selling_price)
  end

  def product_scope
    Product.find(params[:id])
  end
end