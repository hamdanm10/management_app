class SalesReports::Update < ApplicationService
  def call(sales_report:, sales_report_attributes:)
    sales_report.assign_attributes(sales_report_attributes)

    if sales_report.save
      success(sales_report: sales_report)
    else
      failure(sales_report: sales_report)
    end
  end
end