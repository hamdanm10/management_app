class SalesChannels::Destroy < ApplicationService
  def call(sales_channel:)
    if sales_channel.destroy
      success(sales_channel: sales_channel)
    else
      failure(sales_channel: sales_channel)
    end
  end
end