class SalesEntries::Update < ApplicationService
  def call(sales_entry:, sales_entry_attributes:)
    sales_entry.assign_attributes(sales_entry_attributes)

    if sales_entry.save
      success(sales_entry: sales_entry)
    else
      failure(sales_entry: sales_entry)
    end
  end
end