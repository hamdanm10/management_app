namespace :super_admin do
  resource :dashboard, only: %i[show]

  resource :color, only: %i[show]
end