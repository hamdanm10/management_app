class SuperAdmin::SalesChannelsController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @q = SalesChannel.ransack(params[:q])
    @sales_channels = @q.result.order(name: :asc)
    @pagy, @sales_channels = pagy(@sales_channels, limit:)
  end

  def show
    @sales_channel = sales_channel_scope
  end

  def new
    @sales_channel = SalesChannel.new
  end

  def create
    result = SalesChannels::Create.call(sales_channel: sales_channel_params)

    if result.success?
      redirect_to new_super_admin_sales_channel_path, notice: "Sales channel successfully created."
    else
      @sales_channel = result.error[:sales_channel]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @sales_channel = sales_channel_scope
  end

  def update
    result = SalesChannels::Update.call(
      sales_channel: sales_channel_scope,
      sales_channel_attributes: sales_channel_params
    )

    if result.success?
      sales_channel = result.payload[:sales_channel]

      redirect_to edit_super_admin_sales_channel_path(sales_channel), notice: "Sales channel successfully updated."
    else
      @sales_channel = result.error[:sales_channel]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = SalesChannels::Destroy.call(
      sales_channel: sales_channel_scope
    )

    redirect_to super_admin_sales_channels_path, notice: "Sales channel successfully deleted."
  end

  private

  def sales_channel_params
    params.require(:sales_channel).permit(:name, :note)
  end

  def sales_channel_scope
    SalesChannel.find(params[:id])
  end
end