class Supplies::Update < ApplicationService
  def call(supply:, supply_attributes:)
    supply.assign_attributes(supply_attributes)

    if supply.save
      success(supply: supply)
    else
      failure(supply: supply)
    end
  end
end