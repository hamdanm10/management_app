class SalesEntries::Destroy < ApplicationService
  def call(sales_entry:)
    sales_with_reports = sales_entry.sales.includes(:sales_report)
    
    total_old_net_profit = sales_with_reports.sum { |sale| sale.sales_report.net_profit }
    total_old_revenue = sales_with_reports.sum { |sale| sale.sales_report.revenue }

    ActiveRecord::Base.transaction do
      sales_entry.destroy!

      finance = Finance.first

      finance.production_cost -= total_old_revenue - total_old_net_profit
      finance.net_profit -= total_old_net_profit

      finance.save!
    end
  rescue ActiveRecord::RecordInvalid => e
    failure(sales_entry: sales_entry)
  end
end
  