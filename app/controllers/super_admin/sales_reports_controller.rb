class SuperAdmin::SalesReportsController < SuperAdminApplicationController
  def show
    @sales_entry = sales_entry_scope
    @sale = sale_scope
    @sales_report = sales_report_scope
  end

  def edit
    @sales_entry = sales_entry_scope
    @sale = sale_scope
    @sales_report = sales_report_scope
  end

  def update
    @sales_entry = sales_entry_scope
    @sale = sale_scope
    result = SalesReports::Update.call(
      sales_report: sales_report_scope,
      sales_report_attributes: sales_report_params
    )

    if result.success?
      sales_report = result.payload[:sales_report]

      redirect_to edit_super_admin_sales_entry_sale_sales_report_path(@sales_entry, @sale, sales_report), notice: "Sales report successfully updated."
    else
      @sales_report = result.error[:sales_report]

      render :edit, status: :unprocessable_entity
    end
  end

  private 

  def sales_entry_scope
    SalesEntry.find(params[:sales_entry_id])
  end

  def sale_scope
    sales_entry_scope.sales.find(params[:sale_id])
  end

  def sales_report_params
    params.require(:sales_report).permit(:cost_price, :selling_price, :sold_quantity, :unsold_quantity, :waste_quantity)
  end

  def sales_report_scope
    sale_scope.sales_report
  end
end