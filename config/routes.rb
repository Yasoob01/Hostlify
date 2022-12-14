Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
  }

  devise_scope :user do
    root to: "home#index"
    get "sign_in", to: "users/sessions#new"
  end
  get "/sign_in", to: 'home#index'
  get "/admin", to: "admin/admin#index"
  namespace :admin do
    resources :users
  end

  resources :hostel_seeker

  resources :hostel_owner

  resources :hostels do
    resources :rooms
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
