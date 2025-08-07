# frozen_string_literal: true

class Ui::SidebarLinkComponent < ViewComponent::Base
  include LucideRails::RailsHelper

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
      "text-primary-500 bg-primary-100"
    when false
      "text-secondary-500 hover:bg-secondary-100"
    end
  end 
end