module SalesChannelsHelper
  def sales_channels_for_select
    SalesChannel.order(name: :asc).map do |sales_channel|
      [sales_channel.name, sales_channel.id]
    end
  end
end