Rails.application.routes.draw do
  
  resources :kinds

  resources :contacts do
   
    resource :kind, only: [:show]

    resource :phones, only: [:show]
    resource :phone, only: [:update, :create, :destroy]

    resource :address, only: [:show, :update, :create, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
