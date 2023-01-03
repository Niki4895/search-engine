Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/page_lists", to: "page_lists#index"
  get "/page_lists/search", to: "page_lists#search"
  root "page_lists#index"
end
