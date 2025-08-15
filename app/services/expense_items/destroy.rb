class ExpenseItems::Destroy < ApplicationService
  def call(expense_item:)
    if expense_item.destroy
      success(expense_item: expense_item)
    else
      failure(expense_item: expense_item)
    end
  end
end