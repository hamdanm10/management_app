class Supplies::Destroy < ApplicationService
  def call(supply:)
    if supply.destroy
      success(supply: supply)
    else
      failure(supply: supply)
    end
  end
end