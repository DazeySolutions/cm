Rails.application.routes.draw do
  resources :alerts
  devise_for :users
  scope "/admin" do
    resources :users
  end
  resources :events
  resources :sermons
  resources :roles
  resources :a
  root to: "events#index"
 end
