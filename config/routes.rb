
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'donates/new'

  get 'donates/create'

  get 'users/new'

  root to: 'charities#index'

  get  '/signup',  to: 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :about, only: [:index]
  resources :charities, only: [:index, :show]
  resources :users
  resources :donates

end
