class RecordLimit < ApplicationService
  VALID_LIMITS = ["50", "100"].freeze

  def call(limit_param)
    if VALID_LIMITS.include?(limit_param)
      limit_param.to_i
    else
      Pagy::DEFAULT[:items]
    end
  end
end