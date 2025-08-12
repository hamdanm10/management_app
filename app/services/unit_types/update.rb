class UnitTypes::Update < ApplicationService
  def call(unit_type:, unit_type_attributes:)
    unit_type.assign_attributes(unit_type_attributes)

    if unit_type.save
      success(unit_type: unit_type)
    else
      failure(unit_type: unit_type)
    end
  end
end