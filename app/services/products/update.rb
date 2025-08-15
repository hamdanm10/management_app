class Products::Update < ApplicationService
  def call(product:, product_attributes:)
    product.assign_attributes(product_attributes)

    if product.save
      success(product: product)
    else
      failure(product: product)
    end
  end
end