Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "events/filter/:filter" => "events#index", as: :filtered_events
  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
  resources :events do
    resources :registrations
  end
  
end
