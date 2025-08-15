class Expenses::Create < ApplicationService
  def call(expense:)
    expense = Expense.new(expense)

    if expense.save
      success(expense: expense)
    else
      failure(expense: expense)
    end
  end
end