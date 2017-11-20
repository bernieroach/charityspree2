
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'users/new'

  root to: 'charities#index'

<<<<<<< HEAD
  get  '/signup',  to: 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

=======
    resources :about, only: [:index]
>>>>>>> 4917278c383b1f7d8fa7f3fcd3d4791c76024361

    resources :charities, only: [:index, :show]
    resources :users

end
