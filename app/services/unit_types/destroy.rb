class UnitTypes::Destroy < ApplicationService
  def call(unit_type:)
    if unit_type.destroy
      success(unit_type: unit_type)
    else
      failure(unit_type: unit_type)
    end
  end
end