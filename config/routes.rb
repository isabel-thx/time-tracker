Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, except: :index do  
    resources :projects do
      resources :tasks
    end
  end

  post "/users/:id/projects/new" => 'projects#create'

  get "/sign_in" => 'sessions#new', as: "sign_in"
  post "/sign_in" => 'sessions#create'
  delete "/sign_out" => 'sessions#destroy', as: "sign_out"
end
