Rails.application.routes.draw do
  
  namespace :parent do
    root "tops#home"
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

    resources :goal_sheets, only: [:index, :show]
    resources :daily_sheets, only: [:index, :show]
    resources :events, only: [:index, :show]
  end

  namespace :student do
    root "tops#home"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/show/:id", to: "acounts#show"
    get "/edit/:id", to: "acounts#edit", as: "edit"
    patch "/edit/:id", to: "acounts#update"
    delete "/show/:id", to: "acounts#destroy", as: "destroy"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :goal_sheets, only: [:index, :show]
    resources :daily_sheets, only: [:index, :show]
    resources :events, only: [:index, :show]
    resources :score_sheets
  end

  namespace :staff do
    root "goal_sheets#new"
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

    resources :goal_sheets
    resources :daily_sheets
    resources :student_members, only: [:index, :show]
    resources :textbooks
  end
  
end
