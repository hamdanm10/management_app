module PriceHelper
  def format_price(price)
    number_to_currency(
      price,
      unit: "IDR ",
      precision: 2,
      delimiter: ".",
      separator: ",",
      strip_insignificant_zeros: true
    )
  end
end