namespace :super_admin do
  # Main resources
  resource :dashboard, only: %i[show]
  resources :supplies
  resources :ingredient_stocks
  resources :expenses, except: %i[show] do
    resources :expense_items
  end
  resources :stock_entries, except: %i[show] do
    resources :stock_receipts
  end
  resources :sales_entries, except: %i[show] do
    resources :sales, except: %i[show]
  end

  # Master resources
  resources :unit_types
  resources :sales_channels
  resources :products, except: %i[show]
end