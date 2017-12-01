
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # get 'donates/new'
  #
  # get 'donates/create'

  get 'users/new'

  root to: 'charities#index'

  get  '/signup',  to: 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :about, only: [:index]
  resources :users
  resources :charities, only: [:index, :show] do
    resources :donations, only: [:create]
  end

end

Rails.application.routes.draw do
  mount LetsencryptPlugin::Engine, at: '/'  # It must be at root level

  # Other routes...

end