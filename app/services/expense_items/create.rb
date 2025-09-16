class ExpenseItems::Create < ApplicationService
  def call(expense:, expense_item:)    
    ActiveRecord::Base.transaction do
      expense_item = expense.expense_items.new(expense_item)
      expense_item.save!

      finance = Finance.first

      finance.production_cost -= expense_item.total_price.to_d
      finance.save!
    end

    success(expense_item: expense_item)
  rescue ActiveRecord::RecordInvalid => e
    failure(expense_item: expense_item)
  end
end
  