class StockReceipts::Update < ApplicationService
  def call(stock_receipt:, stock_receipt_attributes:)
    stock_receipt.assign_attributes(stock_receipt_attributes)

    if stock_receipt.save
      success(stock_receipt: stock_receipt)
    else
      failure(stock_receipt: stock_receipt)
    end
  end
end