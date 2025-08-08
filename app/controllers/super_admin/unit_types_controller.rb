class SuperAdmin::UnitTypesController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @q = UnitType.ransack(params[:q])
    @unit_types = @q.result.order(name: :asc)
    @pagy, @unit_types = pagy(@unit_types, limit:)
  end

  def show
    @unit_type = unit_type_scope
  end

  def new
    @unit_type = UnitType.new
  end

  def create
    result = UnitTypes::Create.call(unit_type: unit_type_params)

    if result.success?
      redirect_to new_super_admin_unit_type_path, notice: "Unit type successfully created."
    else
      @unit_type = result.error[:unit_type]

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @unit_type = unit_type_scope
  end

  def update
    result = UnitTypes::Update.call(
      unit_type: unit_type_scope,
      unit_type_attributes: unit_type_params
    )

    if result.success?
      unit_type = result.payload[:unit_type]

      redirect_to edit_super_admin_unit_type_path(unit_type), notice: "Unit type successfully updated."
    else
      @unit_type = result.error[:unit_type]

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = UnitTypes::Destroy.call(
      unit_type: unit_type_scope
    )

    redirect_to super_admin_unit_types_path, notice: "Unit type successfully deleted."
  end

  private

  def unit_type_params
    params.require(:unit_type).permit(:name, :note)
  end

  def unit_type_scope
    UnitType.find(params[:id])
  end
end