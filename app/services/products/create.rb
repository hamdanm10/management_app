class Products::Create < ApplicationService
  def call(product:)
    product = Product.new(product)

    if product.save
      success(product: product)
    else
      failure(product: product)
    end
  end
end