Rails.application.routes.draw do   
  devise_for :users
  
  resources :books do
    resources :comments, only: [:create, :destroy, :update]
  end

  resources :categories

  root "pages#home" 
end