class StockEntries::Create < ApplicationService
  def call(stock_entry:)
    stock_entry = StockEntry.new(stock_entry)

    if stock_entry.save
      success(stock_entry: stock_entry)
    else
      failure(stock_entry: stock_entry)
    end
  end
end