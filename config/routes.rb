Rails.application.routes.draw do
  
  namespace :parent do
    root "acounts#new"
  end

  namespace :student do
    root "acounts#new"
    get "/signup", to: "acounts#new"
    post "/signup", to: "acounts#create"
  end

  namespace :staff do
    root "acounts#new"
  end
  
end
