Rails.application.routes.draw do
  resources :tweets
  get 'home/index'
  get '/auth/:provider/callback' => 'sessions#create'
  root to: 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
