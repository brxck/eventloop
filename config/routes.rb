Rails.application.routes.draw do
  root 'static_pages#home'
  get  'login',  to: 'static_pages#login'
  post 'login',  to: 'users#login'
  get  'logout', to: 'users#logout'

  resources :users, :events
end
