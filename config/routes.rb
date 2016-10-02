Rails.application.routes.draw do


  resources :assessments
  resources :individuals
  resources :organizations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :families
  root 'static_pages#home'
  get 'static_pages/home'

  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
