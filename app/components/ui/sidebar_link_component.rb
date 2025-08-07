# frozen_string_literal: true

class Ui::SidebarLinkComponent < ViewComponent::Base
  attr_reader :icon, :url, :name

  def initialize(icon:, url:, name: nil)
    @icon = icon
    @url = url
    @name = name
    @link_classes = link_classes
  end

  def before_render
    @active = is_active?
  end
  
  private

  def is_active?
    helpers.request.path.include?(url)
  end

  def link_classes
    case @active
    when true
      "text-blue-600 bg-blue-50"
    when false
      "text-gray-700 hover:bg-gray-100"
    end
  end 
end