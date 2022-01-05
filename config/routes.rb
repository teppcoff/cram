Rails.application.routes.draw do

  root to: "tops#home"
  
  namespace :parent do
    root "posts#index"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/show/:id", to: "acounts#show"
    get "/edit/:id", to: "acounts#edit", as: "edit"
    patch "/edit/:id", to: "acounts#update"
    delete "/show/:id", to: "acounts#destroy", as: "destroy"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    get "/notifications", to: "notifications#index"
    
    get "/classroom", to: "classrooms#show"

    get "/how_to_use", to: "how_to_use#show"

    resources :daily_sheets, only: [:index, :show]
    resources :events, only: [:index, :show]
    resources :score_sheets, only: [:index, :show]
    resources :posts, only: [:index, :show]
  end

  namespace :student do
    root "posts#index"
    get "/signup", to: "acounts#new"
    get "/signup/set_school", to: "acounts#set_school"
    post "/signup", to: "acounts#create"
    get "/show/:id", to: "acounts#show"
    get "/edit/:id", to: "acounts#edit", as: "edit"
    patch "/edit/:id", to: "acounts#update"
    delete "/show/:id", to: "acounts#destroy", as: "destroy"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    get "/classroom", to: "classrooms#show"

    get "/how_to_use", to: "how_to_use#show"

    resources :daily_sheets, only: [:index, :show]
    resources :events, only: [:index, :show, :edit, :update]
    resources :score_sheets
    resources :posts, only: [:index, :show] 
  end

  namespace :staff do
    root "events#index"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/show/:id", to: "acounts#show"
    get "/edit/:id", to: "acounts#edit", as: "edit"
    patch "/edit/:id", to: "acounts#update"
    delete "/show/:id", to: "acounts#destroy", as: "destroy"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    get "/events/set_period", to: "events#set_period"
    resources :events

    get "/classroom", to: "classrooms#show"

    get "/how_to_use", to: "how_to_use#show"

    post "/daily_sheets/new", to: "daily_sheets#create"
    resources :daily_sheets
    resources :student_members, only: [:index, :show]
    resources :textbooks
    resources :score_sheets, only: [:index, :show]
    resources :posts
    resources :examinations, only: [:show]
  end
  
end
