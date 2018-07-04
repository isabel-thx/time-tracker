Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, except: :index

  resources :projects do
  	resources :tasks
  end

  get "/sign_in" => 'sessions#new', as: "sign_in"
  post "/sign_in" => 'sessions#create'
  delete "/sign_out" => 'sessions#destroy', as: "sign_out"
end
