class Sales::Destroy < ApplicationService
  def call(sale:)
    if sale.destroy
      success(sale: sale)
    else
      failure(sale: sale)
    end
  end
end