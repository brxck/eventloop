Rails.application.routes.draw do
  root 'static_pages#home'
  get  'login',  to: 'static_pages#login'
  post 'login',  to: 'users#login'
  get  'logout', to: 'users#logout'

  get  'events/:id/attend', to: 'events#attend', as: 'attend_event'
  get  'events/:id/unattend', to: 'events#unattend', as: 'unattend_event'  

  resources :users, :events
end
