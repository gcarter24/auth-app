Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    get "/cats" => "cats#index"
    post "/cats" => "cats#create"
    get "/cats/:id" => "cats#show"
    patch "/cats/:id" => "cats#update"
    delete "/cats/:id" => "cats#destroy"
  end
end
