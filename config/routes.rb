Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :tasks do
    put :sort
  end
end
