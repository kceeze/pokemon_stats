Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pokemon#index"

  # get "pokemon" => "pokemon#index"
  # get "pokemon/:id" => "pokemon#show"
  # get "pokemon/list" => "pokemon/list"

  resources :pokemon, path: "/pokemon" do
    get 'list', on: :collection
  end  
end
