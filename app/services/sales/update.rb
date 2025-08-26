class Sales::Update < ApplicationService
  def call(sale:, sale_attributes:)
    sale.assign_attributes(sale_attributes)

    if sale.save
      success(sale: sale)
    else
      failure(sale: sale)
    end
  end
end