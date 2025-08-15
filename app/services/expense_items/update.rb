class ExpenseItems::Update < ApplicationService
  def call(expense_item:, expense_item_attributes:)
    expense_item.assign_attributes(expense_item_attributes)

    if expense_item.save
      success(expense_item: expense_item)
    else
      failure(expense_item: expense_item)
    end
  end
end