class Sales::Create < ApplicationService
  def call(sales_entry:, sale:)
    sale = sales_entry.sales.new(sale)

    if sale.save
      success(sale: sale)
    else
      failure(sale: sale)
    end
  end
end