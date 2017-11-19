
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'users/new'

  root to: 'charities#index'

    get  '/signup',  to: 'users#new'
    resources :charities, only: [:index, :show]
    resources :users

end
