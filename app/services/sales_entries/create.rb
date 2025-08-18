class SalesEntries::Create < ApplicationService
  def call(sales_entry:)
    sales_entry = SalesEntry.new(sales_entry)

    if sales_entry.save
      success(sales_entry: sales_entry)
    else
      failure(sales_entry: sales_entry)
    end
  end
end