class GuestApplicationController < ApplicationController
  allow_unauthenticated_access

  layout "guest/application"
end