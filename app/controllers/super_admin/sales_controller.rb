class SuperAdmin::SalesController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @sales_entry = sales_entry_scope

    @q = @sales_entry.sales.includes(:sales_channel, :product, :sales_report).ransack(params[:q])
    @sales = @q.result.order(created_at: :desc)
    @pagy, @sales = pagy(@sales, limit:)
  end

  def new
    @sales_entry = sales_entry_scope
    @sale = Sale.new
  end

  def create
    @sales_entry = sales_entry_scope
    result = Sales::Create.call(sales_entry: @sales_entry, sale: sale_params)

    if result.success?
      redirect_to new_super_admin_sales_entry_sale_path(@sales_entry), notice: "Sale successfully created."
    else
      @sale = result.error[:sale]
      @sales_report = result.error[:sales_report]

      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  #   @sales_entry = sales_entry_scope
  #   @sale = sale_scope
  # end

  # def update
  #   @sales_entry = sales_entry_scope
  #   result = Sales::Update.call(
  #     sale: sale_scope,
  #     sale_attributes: sale_params
  #   )

  #   if result.success?
  #     sale = result.payload[:sale]

  #     redirect_to edit_super_admin_sales_entry_sale_path(@sales_entry, sale), notice: "Sale successfully updated."
  #   else
  #     @sale = result.error[:sale]

  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def destroy
    result = Sales::Destroy.call(
      sale: sale_scope
    )

    redirect_to super_admin_sales_entry_sale_path, notice: "Sale successfully deleted."
  end

  private 

  def sales_entry_scope
    SalesEntry.find(params[:sales_entry_id])
  end

  def sale_params
    params.require(:sale).permit(:sales_channel_id, :product_id, :quantity, :note)
  end

  def sale_scope
    sales_entry_scope.sales.includes(:sales_channel, :product, :sales_report).find(params[:id])
  end
end