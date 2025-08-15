class Expenses::Destroy < ApplicationService
  def call(expense:)
    if expense.destroy
      success(expense: expense)
    else
      failure(expense: expense)
    end
  end
end