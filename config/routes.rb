Rails.application.routes.draw do
  devise_for :users
  resources :posts

  get '/about', to: 'pages#about'
  root "posts#index"
end
