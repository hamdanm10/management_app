class Expenses::Update < ApplicationService
  def call(expense:, expense_attributes:)
    expense.assign_attributes(expense_attributes)

    if expense.save
      success(expense: expense)
    else
      failure(expense: expense)
    end
  end
end