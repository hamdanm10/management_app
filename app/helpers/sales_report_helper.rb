module SalesReportHelper
  def collected_class(is_collected)
    if is_collected
      "bg-green-50 border-success-500 text-success-500"
    else
      "bg-red-50 border-danger-500 text-danger-500"
    end
  end

  def net_profit_class(net_profit)
    if net_profit.positive?
      "text-success-500"
    elsif net_profit.negative?
      "text-danger-500"
    else
      "text-gray-700"
    end
  end
end