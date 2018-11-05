Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
#  get '/secret', to: 'static_pages#secret'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout', to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'

  get '/sign-up', to: 'users#new'
  post '/sign-up', to: 'users#create'

  get '/monclub', to: 'users#club'
end
