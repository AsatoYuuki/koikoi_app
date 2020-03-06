Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"} 

    devise_scope :user do
      get 'users/select', to: 'users/registrations#select'
      get 'users/confirm_phone', to: 'users/registrations#confirm_phone'
      get 'users/new_address', to: 'users/registrations#new_address'
      get 'users/completed', to: 'users/registrations#completed'
      get 'users/new', to: 'users/registrations#new'
    end
    
    
    root to: "items#index"
    






  
    
  resources :users, only: [:show] do
    collection do
      get "card"
      get "selling"
      get "selling_progress"
      get "sold"
      get "bought_progress"
      get "bought_past"
    end
  end

  resources :items  do
    member do
      get "purchase_confirmation"
      post "purchase"
    end
  end
  resources :categories, only: [:index, :show]
  resource :cards, only: [:new, :create, :show, :update, :destroy]

end
