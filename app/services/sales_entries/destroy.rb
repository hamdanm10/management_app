class SalesEntries::Destroy < ApplicationService
  def call(sales_entry:)
    if sales_entry.destroy
      success(sales_entry: sales_entry)
    else
      failure(sales_entry: sales_entry)
    end
  end
end