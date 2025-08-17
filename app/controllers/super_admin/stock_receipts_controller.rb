class SuperAdmin::StockReceiptsController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @stock_entry = stock_entry_scope

    @q = @stock_entry.stock_receipts.includes(:product).ransack(params[:q])
    @stock_receipts = @q.result.order("products.name ASC")
    @pagy, @stock_receipts = pagy(@stock_receipts, limit:)
  end

  def show
    @stock_entry = stock_entry_scope
    @stock_receipt = stock_receipt_scope
  end

  def new
    @stock_entry = stock_entry_scope
    @stock_receipt = StockReceipt.new
  end

  def create
    @stock_entry = stock_entry_scope
    result = StockReceipts::Create.call(stock_entry: @stock_entry, stock_receipt: stock_receipt_params)

    if result.success?
      redirect_to new_super_admin_stock_entry_stock_receipt_path(@stock_entry), notice: "Stock receipt successfully created."
    else
      @stock_receipt = result.error[:stock_receipt]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @stock_entry = stock_entry_scope
    @stock_receipt = stock_receipt_scope
  end

  def update
    @stock_entry = stock_entry_scope
    result = StockReceipts::Update.call(
      stock_receipt: stock_receipt_scope,
      stock_receipt_attributes: stock_receipt_params
    )

    if result.success?
      stock_receipt = result.payload[:stock_receipt]

      redirect_to edit_super_admin_stock_entry_stock_receipt_path(@stock_entry, stock_receipt), notice: "Stock receipt successfully updated."
    else
      @stock_receipt = result.error[:stock_receipt]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = StockReceipts::Destroy.call(
      stock_receipt: stock_receipt_scope
    )

    redirect_to super_admin_stock_entry_stock_receipts_path, notice: "Stock receipt successfully deleted."
  end

  private 

  def stock_entry_scope
    StockEntry.find(params[:stock_entry_id])
  end

  def stock_receipt_params
    params.require(:stock_receipt).permit(:product_id, :quantity, :note)
  end

  def stock_receipt_scope
    stock_entry_scope.stock_receipts.includes(:product).find(params[:id])
  end
end