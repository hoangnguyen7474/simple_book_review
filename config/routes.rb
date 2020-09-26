Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'comments/update'
  devise_for :users
  root 'pages#home' 
  resources :books do
    resources :comments, only: [:create, :destroy, :update]
  end
end
