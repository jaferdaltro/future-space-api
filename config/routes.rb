require 'sidekiq/web'

Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  mount_devise_token_auth_for 'User', at: 'auth/v1/user'
  root to: "home#index"

  resources :launchers, except: %i(create new)
end
