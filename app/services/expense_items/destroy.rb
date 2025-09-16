class ExpenseItems::Destroy < ApplicationService
  def call(expense_item:)
    old_total_price = expense_item.total_price.to_d

    ActiveRecord::Base.transaction do
      expense_item.destroy!

      finance = Finance.first

      finance.production_cost += old_total_price
      finance.save!
    end
  rescue ActiveRecord::RecordInvalid => e
    failure(expense_item: expense_item)
  end
end