Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'admins/index'
    get 'welcome/index'
    resources :admins # criar as rotas p/ admins
    resources :types
    resources :grape_types
    resources :countries
    resources :wines
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end

  namespace :site do
    get 'welcome/index'
  end

  devise_for :users
  devise_for :admins

  root to: 'site/welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 