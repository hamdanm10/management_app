class SuperAdmin::ExpenseItemsController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @expense = expense_scope

    @q = @expense.expense_items.includes(:unit_type).ransack(params[:q])
    @expense_items = @q.result.order(name: :asc)
    @pagy, @expense_items = pagy(@expense_items, limit:)
  end

  def show
    @expense = expense_scope
    @expense_item = expense_item_scope
  end

  def new
    @expense = expense_scope
    @expense_item = ExpenseItem.new
  end

  def create
    @expense = expense_scope
    result = ExpenseItems::Create.call(expense: @expense, expense_item: expense_item_params)

    if result.success?
      redirect_to new_super_admin_expense_expense_item_path(@expense), notice: "Expense item successfully created."
    else
      @expense_item = result.error[:expense_item]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @expense = expense_scope
    @expense_item = expense_item_scope
  end

  def update
    @expense = expense_scope
    result = ExpenseItems::Update.call(
      expense_item: expense_item_scope,
      expense_item_attributes: expense_item_params
    )

    if result.success?
      expense_item = result.payload[:expense_item]

      redirect_to edit_super_admin_expense_expense_item_path(@expense, expense_item), notice: "Expense item successfully updated."
    else
      @expense_item = result.error[:expense_item]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = ExpenseItems::Destroy.call(
      expense_item: expense_item_scope
    )

    redirect_to super_admin_expense_expense_items_path, notice: "Expense item successfully deleted."
  end

  private 

  def expense_scope
    Expense.find(params[:expense_id])
  end

  def expense_item_params
    params.require(:expense_item).permit(:name, :unit_price, :quantity, :unit_type_id, :note)
  end

  def expense_item_scope
    expense_scope.expense_items.includes(:unit_type).find(params[:id])
  end
end