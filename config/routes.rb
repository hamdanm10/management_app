Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  root "home#index"

  draw(:super_admin)
  draw(:admin)
end
