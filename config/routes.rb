Rails.application.routes.draw do
  resources :posts
  resources :accounts, as: :users, only: [:show,:update]
  resources :friendships , only: [:create,:update, :index]

  devise_for :users,controllers:{
  	omniauth_callbacks: "users/omniauth_callbacks"
  }
  

  post "/custom_sign_up", to: "users/omniauth_callbacks#custom_sign_up"

  authenticated :user do
  	root 'main#home'
  end

  unauthenticated :user do
  	root 'main#unregistered'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
