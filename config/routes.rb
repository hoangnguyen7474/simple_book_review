Rails.application.routes.draw do   
  devise_for :users
  root 'pages#home' 
  
  resources :books do
    resources :comments, only: [:create, :destroy, :update]
  end
  resources :categories 
end