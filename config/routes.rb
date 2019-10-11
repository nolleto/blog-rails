Rails.application.routes.draw do
  resources :posts

  get '/about', to: 'pages#about'
  root "posts#index"
end
