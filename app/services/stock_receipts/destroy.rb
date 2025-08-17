class StockReceipts::Destroy < ApplicationService
  def call(stock_receipt:)
    if stock_receipt.destroy
      success(stock_receipt: stock_receipt)
    else
      failure(stock_receipt: stock_receipt)
    end
  end
end