class StockEntries::Update < ApplicationService
  def call(stock_entry:, stock_entry_attributes:)
    stock_entry.assign_attributes(stock_entry_attributes)

    if stock_entry.save
      success(stock_entry: stock_entry)
    else
      failure(stock_entry: stock_entry)
    end
  end
end