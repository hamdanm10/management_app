class SuperAdmin::FinancesController < SuperAdminApplicationController
  def index
    @finance = finance_scope
  end

  def edit
    @finance = finance_scope
  end

  def update
    result = Finances::Update.call(
      finance: finance_scope,
      finance_attributes: finance_params
    )

    if result.success?
      finance = result.payload[:finance]

      redirect_to edit_super_admin_finance_path(finance), notice: "Finance successfully updated."
    else
      @finance = result.error[:finance]

      render :edit, status: :unprocessable_entity
    end
  end

  private

  def finance_params
    params.require(:finance).permit(:production_cost, :net_profit)
  end

  def finance_scope
    Finance.first
  end
end