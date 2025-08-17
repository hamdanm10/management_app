class StockReceipts::Create < ApplicationService
  def call(stock_entry:, stock_receipt:)
    stock_receipt = stock_entry.stock_receipts.new(stock_receipt)

    if stock_receipt.save
      success(stock_receipt: stock_receipt)
    else
      failure(stock_receipt: stock_receipt)
    end
  end
end