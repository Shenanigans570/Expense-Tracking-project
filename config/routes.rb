Rails.application.routes.draw do
  resources :assets#, except: [:index]
  resources :transactions
  resources :users, except: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  post "/signup", to: "users#show"
  get "/all-assets", to: "assets#index"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"
  get "/authorized_user", to: "users#show"

end
