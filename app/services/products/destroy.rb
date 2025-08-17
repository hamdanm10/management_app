class Products::Destroy < ApplicationService
  def call(product:)
    if product.destroy
      success(product: product)
    else
      failure(product: product)
    end
  end
end