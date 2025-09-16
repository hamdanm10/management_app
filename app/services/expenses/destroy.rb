class Expenses::Destroy < ApplicationService
  def call(expense:)
    expense_items = expense.expense_items
    
    old_total_price = expense_items.sum { |expense_item| expense_item.total_price }

    ActiveRecord::Base.transaction do
      expense.destroy!

      finance = Finance.first

      finance.production_cost += old_total_price

      finance.save!
    end
  rescue ActiveRecord::RecordInvalid => e
    failure(expense: expense)
  end
end
  