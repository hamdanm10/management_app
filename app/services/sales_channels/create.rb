class SalesChannels::Create < ApplicationService
  def call(sales_channel:)
    sales_channel = SalesChannel.new(sales_channel)

    if sales_channel.save
      success(sales_channel: sales_channel)
    else
      failure(sales_channel: sales_channel)
    end
  end
end