namespace :super_admin do
  resources :unit_types
  
  resource :dashboard, only: %i[show]
  resources :ingredient_stocks
end