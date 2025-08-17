class SuperAdmin::StockEntriesController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @stock_entries = StockEntry.includes(stock_receipts: :product).order(entry_at: :desc)
    @pagy, @stock_entries = pagy(@stock_entries, limit:)
  end

  def new
    @stock_entry = StockEntry.new
  end

  def create
    result = StockEntries::Create.call(stock_entry: stock_entry_params)

    if result.success?
      redirect_to new_super_admin_stock_entry_path, notice: "Stock entry successfully created."
    else
      @stock_entry = result.error[:stock_entry]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @stock_entry = stock_entry_scope
  end

  def update
    result = StockEntries::Update.call(
      stock_entry: stock_entry_scope,
      stock_entry_attributes: stock_entry_params
    )

    if result.success?
      stock_entry = result.payload[:stock_entry]

      redirect_to edit_super_admin_stock_entry_path(stock_entry), notice: "Stock entry successfully updated."
    else
      @stock_entry = result.error[:stock_entry]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = StockEntries::Destroy.call(
      stock_entry: stock_entry_scope
    )

    redirect_to super_admin_stock_entries_path, notice: "Stock entry successfully deleted."
  end

  private

  def stock_entry_params
    params.require(:stock_entry).permit(:entry_at)
  end

  def stock_entry_scope
    StockEntry.find(params[:id])
  end
end