namespace :super_admin do
  resources :unit_types, except: %i[show]
  
  resource :dashboard, only: %i[show]
  resources :ingredient_stocks
end