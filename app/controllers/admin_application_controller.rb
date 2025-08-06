class AdminApplicationController < ApplicationController
  before_action :authenticated_admin!
  layout "admin_application"

  private

  def authenticated_admin!
    return if Current.user&.admin?
    render file: Rails.public_path.join("403.html"),
           status: :forbidden,
           layout: false 
  end
end