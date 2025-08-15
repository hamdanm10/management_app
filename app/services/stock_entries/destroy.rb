class StockEntries::Destroy < ApplicationService
  def call(stock_entry:)
    if stock_entry.destroy
      success(stock_entry: stock_entry)
    else
      failure(stock_entry: stock_entry)
    end
  end
end