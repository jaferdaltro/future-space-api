Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/v1/user'
  root to: "home#index"

  resources :launchers, except: %i(create new)
end
