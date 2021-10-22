Rails.application.routes.draw do
  
  namespace :parent do
    root "tops#home"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/goal_sheets", to: "goal_sheets#index"
    get "/goal_sheets/:id", to: "goal_sheets#show", as: "goal_sheet"
    get "/daily_sheets", to: "daily_sheets#index"
    get "/daily_sheets/:id", to: "daily_sheets#show", as: "daily_sheet"
    get "/notifications", to: "notifications#index"
    get "/events", to: "events#index"
    get "/events/show/:id", to: "events#show", as: "event"
  end

  namespace :student do
    root "tops#home"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/goal_sheets", to: "goal_sheets#index"
    get "/goal_sheets/:id", to: "goal_sheets#show", as: "goal_sheet"
    get "/daily_sheets", to: "daily_sheets#index"
    get "/daily_sheets/:id", to: "daily_sheets#show", as: "daily_sheet"
    get "/events", to: "events#index"
    get "/events/show/:id", to: "events#show", as: "event"
  end

  namespace :staff do
    root "goal_sheets#new"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/goal_sheets/new", to: "goal_sheets#new"
    post "/goal_sheets/new", to: "goal_sheets#create"
    get "/goal_sheets", to: "goal_sheets#index"
    get "/goal_sheets/:id", to: "goal_sheets#show", as: "goal_sheet"
    get "/daily_sheets/new", to: "daily_sheets#new"
    post "/daily_sheets/new", to: "daily_sheets#create"
    get "/daily_sheets", to: "daily_sheets#index"
    get "/daily_sheets/:id", to: "daily_sheets#show", as: "daily_sheet"
    get "/student_members", to: "students#index"
    get "/student_members/:id", to: "students#show", as: "student_member"
    get "/events", to: "events#index"
    get "/events/new", to: "events#new"
    post "/events/new", to: "events#create"
    get "/events/show/:id", to: "events#show", as: "event"
    delete "/events/show/:id", to: "events#destroy", as: "event_destroy"
  end
  
end
