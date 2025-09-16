class SalesReports::Update < ApplicationService
  def call(sales_report:, sales_report_attributes:)
    old_net_profit = sales_report.net_profit
    old_revenue = sales_report.revenue

    ActiveRecord::Base.transaction do
      sales_report.assign_attributes(sales_report_attributes)
      sales_report.save!
      
      finance = Finance.first
      
      finance.production_cost -= old_revenue - old_net_profit
      finance.net_profit -= old_net_profit
      
      finance.production_cost += sales_report.revenue - sales_report.net_profit
      finance.net_profit += sales_report.net_profit
      
      finance.save!
    end

    success(sales_report: sales_report)
  rescue ActiveRecord::RecordInvalid => e
    failure(sales_report: sales_report)
  end
end