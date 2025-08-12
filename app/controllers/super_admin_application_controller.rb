class SuperAdminApplicationController < ApplicationController
  before_action :authenticated_super_admin!
  layout "super_admin/application"

  private

  def authenticated_super_admin!
    return if Current.user&.super_admin?
    render file: Rails.public_path.join("403.html"),
           status: :forbidden,
           layout: false 
  end
end