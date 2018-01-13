Rails.application.routes.draw do
  root 'static_pages#home'
  get  'login',  to: 'static_pages#login'
  post 'login',  to: 'users#login'
  get  'logout', to: 'users#logout'

  get  'events/:id/add', to: 'events#add', as: 'add_event'

  resources :users, :events
end
