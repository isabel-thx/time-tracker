Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, except: :index do  
    resources :projects
  end

  resources :projects do
    resources :tasks
  end

  post "/projects/new" => 'projects#create'
  post "/projects/:project_id/tasks/new" => 'tasks#create'

  get "/user/:user_id/tasks" => "reports#index", as: "user_tasks"

  get "/sign_in" => 'sessions#new', as: "sign_in"
  post "/sign_in" => 'sessions#create'
  delete "/sign_out" => 'sessions#destroy', as: "sign_out"
end
