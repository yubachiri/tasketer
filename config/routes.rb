Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  root 'pages#index'
  resources :archived_tasks, only: [:index]
  resources :work_spaces, only: [:index, :create] do
    resources :tasks do
      put :sort
    end
  end
end
