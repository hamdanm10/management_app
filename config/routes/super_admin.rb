namespace :super_admin do
  resources :unit_types
  resources :sales_channels
  
  resource :dashboard, only: %i[show]
  resources :supplies
  resources :ingredient_stocks
  resources :expenses, except: %i[show]
end