module ProductsHelper
  def products_for_select
    Product.order(name: :asc).map do |product|
      [product.name, product.id]
    end
  end
end