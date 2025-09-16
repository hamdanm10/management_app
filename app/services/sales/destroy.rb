class Sales::Destroy < ApplicationService
  def call(sale:)
    sales_report = sale.sales_report

    old_net_profit = sales_report.net_profit
    old_revenue = sales_report.revenue

    ActiveRecord::Base.transaction do
      sale.destroy!

      finance = Finance.first

      finance.production_cost -= old_revenue - old_net_profit
      finance.net_profit -= old_net_profit

      finance.save!
    end
  rescue ActiveRecord::RecordInvalid => e
    failure(sale: sale)
  end
end
  