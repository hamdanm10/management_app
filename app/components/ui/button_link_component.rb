# frozen_string_literal: true

class Ui::ButtonLinkComponent < ViewComponent::Base
  attr_reader :url, :kwargs
  
  BASE_CLASS = "focus:ring-4 font-medium rounded-full focus:outline-none cursor-pointer"

  def initialize(size: "md", variant: "primary", url:, **kwargs)
    @size = size
    @variant = variant
    @url = url
    @kwargs = kwargs

    @kwargs[:class] = [
      BASE_CLASS,
      size_classes,
      variant_classes,
      kwargs[:class]
    ].compact.join(" ")
  end

  private

  def size_classes
    case @size
    when "xs"
      "px-3 py-2 text-xs"
    when "sm"
      "px-3 py-2 text-sm"
    when "md"
      "px-5 py-2.5 text-sm"
    when "lg"
      "px-5 py-3 text-base"
    when "xl"
      "px-6 py-3.5 text-base"
    end
  end

  def variant_classes
    case @variant
    when "primary"
      "text-white bg-primary-500 hover:bg-primary-700 focus:ring-primary-300"
    when "secondary"
      "text-white bg-secondary-500 hover:bg-secondary-700 focus:ring-secondary-300"
    when "dark"
      "text-white bg-dark-500 hover:bg-dark-700 focus:ring-dark-300"
    when "light"
      "text-dark-500 bg-light-100 hover:bg-light-700 focus:ring-light-300 border border-light-300"
    when "success"
      "text-white bg-success-500 hover:bg-success-700 focus:ring-success-300"
    when "danger"
      "text-white bg-danger-500 hover:bg-danger-700 focus:ring-danger-300"
    when "warning"
      "text-white bg-warning-500 hover:bg-warning-700 focus:ring-warning-300"
    when "info"
      "text-white bg-info-500 hover:bg-info-700 focus:ring-info-300"
    end
  end
end
