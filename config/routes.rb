Rails.application.routes.draw do
  resources :productos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "productos#index"
  get "/productos/new", to: "productos#new"
  post "/productos", to: "productos#create"
  delete "/productos/:id", to: "productos#destroy"
  get "/productos/:id/edit", to: "productos#edit"
  patch "/productos/:id", to: "productos#update"

end
