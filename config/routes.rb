Rails.application.routes.draw do
  
  namespace :parent do
    root "sessions#new"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
  end

  namespace :student do
    root "sessions#new"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
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
    get "/goal_sheets/:id", to: "goal_sheets#show"
  end
  
end
