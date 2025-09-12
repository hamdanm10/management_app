class Finances::Update < ApplicationService
  def call(finance:, finance_attributes:)
    finance.assign_attributes(finance_attributes)

    if finance.save
      success(finance: finance)
    else
      failure(finance: finance)
    end
  end
end