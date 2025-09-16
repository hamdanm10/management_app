class ExpenseItems::Update < ApplicationService
  def call(expense_item:, expense_item_attributes:)
    old_total_price = expense_item.total_price.to_d
    
    ActiveRecord::Base.transaction do
      expense_item.assign_attributes(expense_item_attributes)
      expense_item.save!

      finance = Finance.first

      finance.production_cost += old_total_price
      finance.production_cost -= expense_item.total_price.to_d
      finance.save!
    end

    success(expense_item: expense_item)
  rescue ActiveRecord::RecordInvalid => e
    failure(expense_item: expense_item)
  end
end
  