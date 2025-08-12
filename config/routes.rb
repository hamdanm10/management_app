Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  draw(:super_admin)
  draw(:admin)
  draw(:guest)
end
