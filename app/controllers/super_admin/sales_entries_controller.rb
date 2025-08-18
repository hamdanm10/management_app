class SuperAdmin::SalesEntriesController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @q = SalesEntry.ransack(params[:q])
    @sales_entries = @q.result.order(sale_at: :desc)
    @pagy, @sales_entries = pagy(@sales_entries, limit:)
  end

  def new
    @sales_entry = SalesEntry.new
  end

  def create
    result = SalesEntries::Create.call(sales_entry: sales_entry_params)

    if result.success?
      redirect_to new_super_admin_sales_entry_path, notice: "Sales entry successfully created."
    else
      @sales_entry = result.error[:sales_entry]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @sales_entry = sales_entry_scope
  end

  def update
    result = SalesEntries::Update.call(
      sales_entry: sales_entry_scope,
      sales_entry_attributes: sales_entry_params
    )

    if result.success?
      sales_entry = result.payload[:sales_entry]

      redirect_to edit_super_admin_sales_entry_path(sales_entry), notice: "Sales entry successfully updated."
    else
      @sales_entry = result.error[:sales_entry]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = SalesEntries::Destroy.call(
      sales_entry: sales_entry_scope
    )

    redirect_to super_admin_sales_entries_path, notice: "Sales entry successfully deleted."
  end

  private

  def sales_entry_params
    params.require(:sales_entry).permit(:sale_at)
  end

  def sales_entry_scope
    SalesEntry.find(params[:id])
  end
end