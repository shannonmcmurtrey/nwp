Rails.application.routes.draw do


  resources :individuals
  resources :cohorts
  resources :assessments
  resources :organizations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root 'static_pages#home'
  get 'static_pages/home'

  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
