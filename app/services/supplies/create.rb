class Supplies::Create < ApplicationService
  def call(supply:)
    supply = Supply.new(supply)

    if supply.save
      success(supply: supply)
    else
      failure(supply: supply)
    end
  end
end