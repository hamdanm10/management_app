class UnitTypes::Create < ApplicationService
  def call(unit_type:)
    unit_type = UnitType.new(unit_type)

    if unit_type.save
      success(unit_type: unit_type)
    else
      failure(unit_type: unit_type)
    end
  end
end