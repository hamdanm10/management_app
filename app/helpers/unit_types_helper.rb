module UnitTypesHelper
  def unit_types_for_select
    UnitType.order(name: :asc).map do |unit_type|
      [unit_type.name.titleize, unit_type.id]
    end
  end
end