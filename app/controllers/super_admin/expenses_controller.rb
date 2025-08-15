class SuperAdmin::ExpensesController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @expenses = Expense.order(expense_at: :desc)
    @pagy, @expenses = pagy(@expenses, limit:)
  end

  def new
    @expense = Expense.new
  end

  def create
    result = Expenses::Create.call(expense: expense_params)

    if result.success?
      redirect_to new_super_admin_expense_path, notice: "Expense successfully created."
    else
      @expense = result.error[:expense]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @expense = expense_scope
  end

  def update
    result = Expenses::Update.call(
      expense: expense_scope,
      expense_attributes: expense_params
    )

    if result.success?
      expense = result.payload[:expense]

      redirect_to edit_super_admin_expense_path(expense), notice: "Expense successfully updated."
    else
      @expense = result.error[:expense]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = Expenses::Destroy.call(
      expense: expense_scope
    )

    redirect_to super_admin_expenses_path, notice: "Expense successfully deleted."
  end

  private

  def expense_params
    params.require(:expense).permit(:expense_at)
  end

  def expense_scope
    Expense.find(params[:id])
  end
end