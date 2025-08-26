class Sales::Create < ApplicationService
  def call(sales_entry:, sale:)
    ActiveRecord::Base.transaction do
      sale = sales_entry.sales.new(sale)
      sale.save!

      sales_report = sale.create_sales_report!(
        cost_price: 0,
        selling_price: 0,
        sold_quantity: 0,
        unsold_quantity: sale.quantity,
        waste_quantity: 0,
        total_revenue: 0,
        total_profit: 0,
      )

      success(sale: sale)
    end
  rescue ActiveRecord::RecordInvalid => e
    failure(sale: sale)
  end
end