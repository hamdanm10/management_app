namespace :admin do
  resource :dashboard, only: %i[show]
end