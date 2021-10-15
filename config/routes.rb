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
    root "sessions#new"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
  end
  
end
