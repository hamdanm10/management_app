class ExpenseItems::Create < ApplicationService
  def call(expense:, expense_item:)
    expense_item = expense.expense_items.new(expense_item)

    if expense_item.save
      success(expense_item: expense_item)
    else
      failure(expense_item: expense_item)
    end
  end
end