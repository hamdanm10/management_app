namespace :super_admin do
  resources :unit_types
  resources :sales_channels
  
  resource :dashboard, only: %i[show]
  resources :ingredient_stocks
end