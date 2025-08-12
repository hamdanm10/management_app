# frozen_string_literal: true

class Ui::SelectInputComponent < ViewComponent::Base
  attr_reader :form, :field_name, :records, :current_value, :kwargs

  BASE_CLASS = "block w-full p-2 text-gray-700 border border-light-300 rounded-lg bg-white text-sm focus:ring-primary-500 focus:border-primary-500"

  def initialize(form:, field_name:, records:, current_value: nil, **kwargs)
    @form = form
    @field_name = field_name
    @records = records
    @current_value = current_value
    @kwargs = kwargs

    @kwargs[:class] = [
      BASE_CLASS,
      kwargs[:class]
    ].compact.join(" ")
  end
end