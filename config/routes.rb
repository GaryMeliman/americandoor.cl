Rails.application.routes.draw do

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'wp_admin_login' => 'devise/sessions#new', :as => :new_user_session
    post 'wp_admin_login' => 'devise/sessions#create', :as => :user_session
    delete 'wp_admin_logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  get 'admin_dashboard/index'

  get 'home/index'

  get 'about/index'
  resources :products
  resources :categories
  root 'home#index'
  resources "contacts", only: [:new, :create]
end
