# frozen_string_literal: true

class Ui::SidebarComponent < ViewComponent::Base
  attr_reader :sidebar_id
  
  def initialize(sidebar_id:)
    @sidebar_id = sidebar_id
  end
end