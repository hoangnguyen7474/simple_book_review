Rails.application.routes.draw do   
  devise_for :users  
  
  resources :books do
    resources :comments, only: [:create, :destroy, :update]

    member do
      delete 'delete_photo/:photo_id', action: 'delete_photo', as: 'delete_photo'
    end
  end
  
  resources :categories 

  root 'pages#home' 
end