Rails.application.routes.draw do
  devise_for :users, path: "users", controllers: { 
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  
  devise_for :admins, path: "admins", controllers: { 
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'users/dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        get 'admins/dashboard/index', as: :authenticated_root
      end
    end
  end

  root "home#index"
end
