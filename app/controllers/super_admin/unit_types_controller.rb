class SuperAdmin::UnitTypesController < SuperAdminApplicationController
  def index
    limit = RecordLimit.call(params[:limit])

    @q = UnitType.ransack(params[:q])
    @unit_types = @q.result.order(name: :asc)
    @pagy, @unit_types = pagy(@unit_types, limit:)
  end
end