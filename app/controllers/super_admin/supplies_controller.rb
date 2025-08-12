class SuperAdmin::SuppliesController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @q = Supply.includes(:unit_type).ransack(params[:q])
    @supplies = @q.result.order(name: :asc)
    @pagy, @supplies = pagy(@supplies, limit:)
  end

  def show
    @supply = supply_scope
  end

  def new
    @supply = Supply.new
  end

  def create
    result = Supplies::Create.call(supply: supply_params)

    if result.success?
      redirect_to new_super_admin_supply_path, notice: "Supply successfully created."
    else
      @supply = result.error[:supply]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @supply = supply_scope
  end

  def update
    result = Supplies::Update.call(
      supply: supply_scope,
      supply_attributes: supply_params
    )

    if result.success?
      supply = result.payload[:supply]

      redirect_to edit_super_admin_supply_path(supply), notice: "Supply successfully updated."
    else
      @supply = result.error[:supply]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = Supplies::Destroy.call(
      supply: supply_scope
    )

    redirect_to super_admin_supplies_path, notice: "Supply successfully deleted."
  end

  private 

  def supply_params
    params.require(:supply).permit(:name, :quantity, :unit_type_id, :note)
  end

  def supply_scope
    Supply.includes(:unit_type).find(params[:id])
  end
end