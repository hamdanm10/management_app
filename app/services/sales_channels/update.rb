class SalesChannels::Update < ApplicationService
  def call(sales_channel:, sales_channel_attributes:)
    sales_channel.assign_attributes(sales_channel_attributes)

    if sales_channel.save
      success(sales_channel: sales_channel)
    else
      failure(sales_channel: sales_channel)
    end
  end
end