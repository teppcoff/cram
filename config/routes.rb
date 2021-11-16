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

    resources :daily_sheets, only: [:index, :show]
    resources :events, only: [:index, :show]
    resources :score_sheets, only: [:index, :show]
    resources :posts, only: [:index, :show]
  end

  namespace :student do
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

    resources :daily_sheets, only: [:index, :show]
    resources :events, only: [:index, :show]
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

    resources :daily_sheets
    resources :student_members, only: [:index, :show]
    resources :textbooks
    resources :score_sheets, only: [:index, :show]
    resources :posts
  end
  
end
